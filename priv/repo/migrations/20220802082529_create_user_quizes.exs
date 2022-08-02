defmodule QuestionaireLive.Repo.Migrations.CreateUserQuizes do
  use Ecto.Migration

  def change do
    create table(:user_quizes) do
      add :result, :integer
      add :status, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :quiz_id, references(:quizes, on_delete: :nothing)

      timestamps()
    end

    create index(:user_quizes, [:user_id])
    create index(:user_quizes, [:quiz_id])
  end
end
