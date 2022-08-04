# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     QuestionaireLive.Repo.insert!(%QuestionaireLive.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias QuestionaireLive.Repo
alias QuestionaireLive.Users.User

user =
  User.changeset(%User{}, %{
    email: "admin@gmail.com",
    role: "admin",
    password: "Passw0rd",
    confirm_password: "Passw0rd"
  })
  |> Repo.insert()
