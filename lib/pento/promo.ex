defmodule Pento.Promo do
  alias Pento.Promo.Recipient

  def change_recipient(%Recipient{} = recipient, attrs \\ %{}) do
    Recipient.changeset(recipient, attrs)
  end

  def send_promo(%{first_name: first_name, email: email}) do
    send_email(first_name, email)
  end

  defp send_email(first_name, email) do
    IO.inspect({first_name, email}, label: "send_email")
    {:error, "unkown email address"}
  end
end
