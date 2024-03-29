defmodule Pento.Promo.Recipient do
  import Ecto.Changeset

  alias __MODULE__

  defstruct [:first_name, :email]
  @types %{first_name: :string, email: :string}

  def changeset(%Recipient{} = user, attrs) do
    {user, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:first_name, :email])
    |> validate_format(:email, ~r/@/)
  end
end
