defmodule QuestionaireLive.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question, :string
      add :subject_id, references(:subjects, on_delete: :nothing)
      add :quiz_id, references(:quizes, on_delete: :delete_all)

      timestamps()
    end

    create index(:questions, [:subject_id])
    create index(:questions, [:quiz_id])
  end
end
