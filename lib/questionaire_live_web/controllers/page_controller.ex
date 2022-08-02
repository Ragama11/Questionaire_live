defmodule QuestionaireLiveWeb.PageController do
  use QuestionaireLiveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
