defmodule QuestionaireLive.Deposits.Deposit do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias QuestionaireLive.Repo
  alias QuestionaireLive.Deposits.Deposit

  schema "deposits" do
    belongs_to :account_transactions, QuestionaireLive.Account_transactions.Account_transaction
    field :amount, :string
    field :msisdn, :string
    field :"ref.no", :string

    timestamps()
  end

  @doc false
  def changeset(deposit, attrs) do
    deposit
    |> cast(attrs, [:msisdn, :amount, :"ref.no", :account_transaction_id])
    |> validate_required([:msisdn, :amount, :"ref.no", :account_transaction_id])
  end

  def list_deposits do
    Repo.all(Deposit)
  end

  def get_deposit!(id), do: Repo.get!(Deposit, id)

  def create_deposit(attrs \\ %{}) do
    %Deposit{}
    |> Deposit.changeset(attrs)
    |> Repo.insert()
  end

  def update_deposit(%Deposit{} = deposit, attrs) do
    deposit
    |> Deposit.changeset(attrs)
    |> Repo.update()
  end

  def delete_deposit(%Deposit{} = deposit) do
    Repo.delete(deposit)
  end

  def change_deposit(%Deposit{} = deposit, attrs \\ %{}) do
    Deposit.changeset(deposit, attrs)
  end

  def add_account_transactions_deposits(account_transactions, details) do
    account_transactions
    |> Ecto.build_assoc(:deposts)
    |> Deposit.changeset(details)
    |> Repo.insert()
  end
end
