defmodule PentoWeb.CorrectLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    IO.inspect(socket)
  end

  def render(assigns) do
    ~L"""
      <h1>Your guess: <%= @guess %> is Correct!</h1>
      <h2>
        Your score: <%= @score %>
      </h2>
      <h2>
        <a href="<%= live_patch "wrong_live", to: Routes.live_path(@socket, PentoWeb.WrongLive) %>" Restart Game</a>
      </h2>
    """
  end
end
