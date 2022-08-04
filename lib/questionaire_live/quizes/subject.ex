defmodule QuestionaireLive.Quizes.Subject do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subjects" do
    field :name, :string
    has_many :questions, QuestionaireLive.Quizes.Question

    timestamps()
  end

  @doc false
  def changeset(subject, attrs) do
    subject
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)

  end
end
