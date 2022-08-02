defmodule QuestionaireLive.Repo do
  use Ecto.Repo,
    otp_app: :questionaire_live,
    adapter: Ecto.Adapters.Postgres
end
