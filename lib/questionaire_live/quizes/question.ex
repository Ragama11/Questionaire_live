defmodule QuestionaireLive.Quizes.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :question, :string
    field :quiz_id, :id
    has_many :answers, QuestionaireLive.Quizes.Answer
    belongs_to :subject, QuestionaireLive.Quizes.Subject
    

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question])
    |> validate_required([:question])
  end
end
