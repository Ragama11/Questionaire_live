defmodule QuestionaireLive.Account_transactions.Account_transaction do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias QuestionaireLive.Repo
  alias QuestionaireLive.Account_transactions.Account_transaction


  schema "account_transactions" do
    belongs_to :account, QuestionaireLive.Account.Accounts
    field :amount, :string
    field :currency, :string
    field :transaction_type, :string
    # has_many :deposits, QuestionaireLive.Deposits.Deposit

    timestamps()
  end

  def changeset(account_transaction, attrs) do
    account_transaction
    |> cast(attrs, [:account_id, :transaction_type, :currency, :amount])
    |> validate_required([:account_id, :transaction_type, :currency, :amount])
  end

  def list_account_transactions do
    Repo.all(Account_transaction)
  end

  def get_account_transaction!(id), do: Repo.get!(Account_transaction, id)

  def create_account_transaction(attrs \\ %{}) do
    %Account_transaction{}
    |> Account_transaction.changeset(attrs)
    |> Repo.insert()
  end

  def update_account_transaction(%Account_transaction{} = account_transaction, attrs) do
    account_transaction
    |> Account_transaction.changeset(attrs)
    |> Repo.update()
  end

  def delete_account_transaction(%Account_transaction{} = account_transaction) do
    Repo.delete(account_transaction)
  end

  def change_account_transaction(%Account_transaction{} = account_transaction, attrs \\ %{}) do
    Account_transaction.changeset(account_transaction, attrs)
  end

  def add_account_transaction(account, details) do
    account
    |> Ecto.build_assoc(:account_transactions)
    |> Account_transaction.changeset(details)
    |> Repo.insert()
  end
end
