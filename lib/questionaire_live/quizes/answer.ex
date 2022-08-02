defmodule QuestionaireLive.Quizes.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :value, :string
    field :is_correct, :boolean
    belongs_to :question, QuestionaireLive.Quizes.Question

    timestamps()
  end

  @doc false
  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:value])
    |> validate_required([:value])
  end
end
