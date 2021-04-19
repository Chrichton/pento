defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     assign(
       socket,
       score: 0,
       message: "Guess a number",
       number_to_guess: Enum.random(1..10) |> Integer.to_string()
     )}
  end

  def render(assigns) do
    ~L"""
      <h1>Your score: <%= @score %></h1>
      <h2>
        <%= @message %>
      </h2>
      <h2>
        <%= for n <- 1..10 do %>
          <a href="#" phx-click="guess" phx-value-number="<%= n %>"><%= n %></a>
        <% end %>
      </h2>
    """
  end

  def handle_event("guess", %{"number" => guess}, socket) do
    if guess == socket.assigns.number_to_guess do
      socket =
        assign(
          socket,
          score: socket.assigns.score + 10
        )

      {
        :noreply,
        push_patch(socket, to: "/guessed")
      }
    else
      message = "Your guess: #{guess}. Wrong. Guess again. "
      score = socket.assigns.score - 1

      {
        :noreply,
        assign(
          socket,
          message: message,
          score: score
        )
      }
    end
  end
end
