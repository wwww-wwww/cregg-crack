defmodule Cregg.Repo.Migrations.CreateCracks do
  use Ecto.Migration

  def change do
    create table(:cracks) do
      add :cracks, :integer
    end

  end
end
