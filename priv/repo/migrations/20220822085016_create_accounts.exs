defmodule QuestionaireLive.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :balance, :string
      add :currency, :string
      add :user_id, :integer
      add :account_number, :string

      timestamps()
    end
  end
end
