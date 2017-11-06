defmodule IspychangeWeb.PageController do
  use IspychangeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
