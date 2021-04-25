defmodule Pento.EmailTest do
  use ExUnit.Case
  use Bamboo.Test

  test "welcome email" do
    email = Pento.Email.welcome_email("ralph@example.com", "Thanks for joining")

    assert email.to == "ralph@example.com"
    assert email.from == "heiko.goes@gaebler-goes.de"
    assert email.html_body =~ "<p>Thanks for joining</p>"
    assert email.text_body =~ "Thanks for joining"
  end

  test "sends welcome email" do
    email = Pento.Email.welcome_email("ralph@example.com", "Thanks for joining")

    email |> Pento.Mailer.deliver_now()

    # Works with deliver_now and deliver_later
    assert_delivered_email(email)
  end
end
