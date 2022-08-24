defmodule QuestionaireLive.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  alias QuestionaireLive.Account.Accounts
  alias QuestionaireLive.Repo




  schema "users" do
    pow_user_fields()
    field :role, :string, default: "admin"
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    has_one :account, QuestionaireLive.Account.Accounts

    has_many :user_quizes, QuestionaireLive.Quizes.User_quiz


    timestamps()
  end

  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(user admin))
  end


  def add_account_user(user, details) do
    user
    |> Ecto.build_assoc(:account)
    |> Accounts.changeset(details)
    |> Repo.insert()
  end
end
