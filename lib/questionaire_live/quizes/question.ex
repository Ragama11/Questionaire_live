defmodule QuestionaireLive.Quizes.Question do
  use Ecto.Schema
  import Ecto.Changeset

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
end
