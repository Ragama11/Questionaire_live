defmodule QuestionaireLive.Withdrawals.Withdrawal do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias QuestionaireLive.Repo
  alias QuestionaireLive.Withdrawals.Withdrawal

  schema "withdrawals" do
    belongs_to :account_transactions, QuestionaireLive.Account_transactions.Account_transaction
    field :amount, :integer
    field :msisdn, :string
    field :reference_number, :string

    timestamps()
  end

  @doc false
  def changeset(withdrawal, attrs) do
    withdrawal
    |> cast(attrs, [:msisdn, :amount, :reference_number, :account_transaction_id])
    |> validate_required([:msisdn, :amount, :reference_number, :account_transaction_id])
  end

  def list_withdrawals do
    Repo.all(Withdrawal)
  end

  def get_withdrawal!(id), do: Repo.get!(Withdrawal, id)

  def create_withdrawal(attrs \\ %{}) do
    %Withdrawal{}
    |> Withdrawal.changeset(attrs)
    |> Repo.insert()
  end

  def update_withdrawal(%Withdrawal{} = withdrawal, attrs) do
    withdrawal
    |> Withdrawal.changeset(attrs)
    |> Repo.update()
  end

  def delete_withdrawal(%Withdrawal{} = withdrawal) do
    Repo.delete(withdrawal)
  end

  def change_withdrawal(%Withdrawal{} = withdrawal, attrs \\ %{}) do
    Withdrawal.changeset(withdrawal, attrs)
  end

  def add_account_transactions_withdrawals(account_transactions, details) do
    account_transactions
    |> Ecto.build_assoc(:withdrawals)
    |> Withdrawal.changeset(details)
    |> Repo.insert()
  end
end
