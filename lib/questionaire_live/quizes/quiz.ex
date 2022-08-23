defmodule QuestionaireLive.Quizes.Quiz do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias QuestionaireLive.Repo
  alias QuestionaireLive.Quizes.Quiz

  schema "quizes" do
    field :name, :string
    has_many :user_quizes, QuestionaireLive.Quizes.User_quiz, on_delete: :delete_all
    has_many :questions, QuestionaireLive.Quizes.Question, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(quiz, attrs) do
    quiz
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

  def list_quizes do
    Repo.all(Quiz)
  end

  def get_quiz!(id), do: Repo.get!(Quiz, id) |> Repo.preload([:questions])

  def create_quiz(attrs \\ %{}) do
    %Quiz{}
    |> Quiz.changeset(attrs)
    |> Repo.insert()
  end

  def update_quiz(%Quiz{} = quiz, attrs) do
    quiz
    |> Quiz.changeset(attrs)
    |> Repo.update()
  end

  def delete_quiz(%Quiz{} = quiz) do
    Repo.delete(quiz)
  end

  def change_quiz(%Quiz{} = quiz, attrs \\ %{}) do
    Quiz.changeset(quiz, attrs)
  end
end
