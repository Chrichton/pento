defmodule PentoWeb.PageLiveTest do
  use PentoWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:error, {:redirect, %{to: path}}} = live(conn, "/")

    assert path == "/users/log_in"
  end
end
