defmodule KegCopRAPI.Web.PageController do
  use KegCopRAPI.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
