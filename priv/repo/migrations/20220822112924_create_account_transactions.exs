defmodule QuestionaireLive.Repo.Migrations.CreateAccountTransactions do
  use Ecto.Migration

  def change do
    create table(:account_transactions) do
      add :account_id, :integer
      add :transaction_type, :string
      add :currency, :string
      add :amount, :string

      timestamps()
    end
  end
end
