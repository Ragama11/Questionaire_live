defmodule QuestionaireLive.Repo.Migrations.CreateDeposits do
  use Ecto.Migration

  def change do
    create table(:deposits) do
      add :msisdn, :string
      add :amount, :string
      add :"ref.no", :string
      add :account_transaction_id, :integer

      timestamps()
    end
  end
end
