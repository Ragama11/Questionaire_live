defmodule QuestionaireLive.Quizes.Question do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias QuestionaireLive.Repo
  alias QuestionaireLive.Quizes.Question


  schema "questions" do
    field :question, :string
    has_many :answers, QuestionaireLive.Quizes.Answer
    belongs_to :subject, QuestionaireLive.Quizes.Subject
    belongs_to :quiz, QuestionaireLive.Quizes.Quiz

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question])
    |> validate_required([:question])
    |> unique_constraint(:question)
  end


  def list_questions do
    Repo.all(Question)
  end

  def get_question!(id), do: Repo.get!(Question, id) |> Repo.preload([:answers])

  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  def add_quiz_question(quiz, details) do
    quiz
    |> Ecto.build_assoc(:questions)
    |> Question.changeset(details)
    |> Repo.insert()
  end

  def add_question_subject(subject, details) do
    subject
    |> Ecto.build_assoc(:questions)
    |> Question.changeset(details)
    |> Repo.insert()
  end

  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  def change_question(%Question{} = question, attrs \\ %{}) do
    Question.changeset(question, attrs)
  end
end
