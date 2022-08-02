defmodule QuestionaireLive.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :value, :string
      add :question_id, references(:questions, on_delete: :nothing)
      add :is_correct, :boolean

      timestamps()
    end

    create index(:answers, [:question_id])
  end
end
