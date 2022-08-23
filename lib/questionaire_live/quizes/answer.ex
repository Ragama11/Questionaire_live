defmodule QuestionaireLive.Quizes.Answer do
  use Ecto.Schema
  import Ecto.Changeset
  alias QuestionaireLive.Quizes.Answer
  import Ecto.Query, warn: false
  alias QuestionaireLive.Repo

  schema "answers" do
    field :value, :string
    field :is_correct, :boolean
    belongs_to :question, QuestionaireLive.Quizes.Question

    timestamps()
  end

  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:value])
    |> validate_required([:value])
    |> unique_constraint(:value)
  end

  def list_answers do
    Repo.all(Answer)
  end

  def get_answer!(id), do: Repo.get!(Answer, id)

  def create_answer(attrs \\ %{}) do
    %Answer{}
    |> Answer.changeset(attrs)
    |> Repo.insert()
  end

  def add_question_answer(question, attrs) do
    question
    |> Ecto.build_assoc(:answers)
    |> Answer.changeset(attrs)
    |> Repo.insert()
  end

  def update_answer(%Answer{} = answer, attrs) do
    answer
    |> Answer.changeset(attrs)
    |> Repo.update()
  end

  def delete_answer(%Answer{} = answer) do
    Repo.delete(answer)
  end

  def change_answer(%Answer{} = answer, attrs \\ %{}) do
    Answer.changeset(answer, attrs)
  end
end
