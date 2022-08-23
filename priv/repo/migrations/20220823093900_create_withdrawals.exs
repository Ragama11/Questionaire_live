defmodule QuestionaireLive.Repo.Migrations.CreateWithdrawals do
  use Ecto.Migration

  def change do
    create table(:withdrawals) do
      add :msisdn, :string
      add :amount, :integer
      add :reference_number, :string
      add :account_transaction_id, :integer

      timestamps()
    end
  end
end
