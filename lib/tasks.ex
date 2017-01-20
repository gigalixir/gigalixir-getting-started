defmodule Tasks do  
  def migrate do
    {:ok, _} = Application.ensure_all_started(:gigalixir_getting_started)

    path = Application.app_dir(:web, "priv/repo/migrations")

    Ecto.Migrator.run(GigalixirGettingStarted.Repo, path, :up, all: true)
  end
end  
