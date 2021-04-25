defmodule Pento.Email do
  import Bamboo.Email

  def welcome_email(to, body) do
    base_email()
    |> to(to)
    |> subject("Welcome!!!")
    |> put_header("Reply-To", "heiko.goes@gaebler-goes.de")
    |> html_body("<p>" <> body <> "</p>")
    |> text_body(body)
  end

  defp base_email do
    new_email()
    |> from("heiko.goes@gaebler-goes.de")
  end
end
