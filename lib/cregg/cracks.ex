defmodule Cregg.Cracks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cracks" do
    field :cracks, :integer
  end

  @doc false
  def changeset(cracks, attrs) do
    cracks
    |> cast(attrs, [:cracks])
    |> validate_required([:cracks])
  end
end
