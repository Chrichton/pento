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
        <%= live_patch "Restart Game", to: Routes.live_path(@socket, PentoWeb.WrongLive) %>
      </h2>
    """
  end
end
