defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, session, socket) do
    {:ok,
     assign(
       socket,
       score: 0,
       message: "Guess a number",
       number_to_guess: Enum.random(1..10) |> Integer.to_string(),
       number_guessed: false,
       user: Pento.Accounts.get_user_by_session_token(session["user_token"]),
       session_id: session["live_socket_id"]
     )}
  end

  def render(assigns) do
    ~L"""
      <h1>Your score: <%= @score %></h1>
      <h2>
        <%= @message %>
      </h2>
      <h2>
        <%= if @number_guessed do %>
          <%= live_patch "Restart Game", to: Routes.live_path(@socket, PentoWeb.WrongLive) %>
        <% else %>
          <%= for n <- 1..10 do %>
            <a href="#" phx-click="guess" phx-value-number="<%= n %>"><%= n %></a>
          <% end %>
        <% end %>
      </h2>
      <pre>
        <%= @user.email %>
        <%= @session_id %>
      </pre>
    """
  end

  def handle_event("guess", %{"number" => guess}, socket) do
    if guess == socket.assigns.number_to_guess do
      {
        :noreply,
        assign(
          socket,
          message: "Your guess: #{guess} is correct. ",
          score: socket.assigns.score + 10,
          number_guessed: true
        )
      }
    else
      {
        :noreply,
        assign(
          socket,
          message: "Your guess: #{guess}. Wrong. Guess again. ",
          score: socket.assigns.score - 1
        )
      }
    end
  end

  def handle_params(_params, _uri, socket) do
    if socket.assigns.number_guessed,
      do: {:noreply, assign(socket, number_guessed: false)},
      else: {:noreply, socket}
  end
end
