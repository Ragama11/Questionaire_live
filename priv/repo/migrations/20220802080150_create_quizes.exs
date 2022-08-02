defmodule QuestionaireLive.Repo.Migrations.CreateQuizes do
  use Ecto.Migration

  def change do
    create table(:quizes) do
      add :name, :string

      timestamps()
    end
  end
end
