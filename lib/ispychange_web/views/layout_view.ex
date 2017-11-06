defmodule IspychangeWeb.LayoutView do
  use IspychangeWeb, :view

  def client_path do
    :ispychange
    |> Application.get_env(IspychangeWeb.LayoutView)
    |> Keyword.fetch(:client_path)
    |> case do
      {:ok, client_path} -> client_path
      _ -> asset_manifest["main.js"]
    end
  end

  def styles_path do
    :ispychange
    |> Application.get_env(IspychangeWeb.LayoutView)
    |> Keyword.fetch(:styles_path)
    |> case do
      {:ok, styles_path} -> styles_path
      _ -> asset_manifest["main.css"]
    end
  end

  def asset_manifest do
    resolve = fn ->
      case File.read("priv/static/asset-manifest.json") do
        {:ok, content} -> Poison.Parser.parse!(content)
        _ -> nil
      end
    end

    case Ispychange.Cache.get(:manifest, resolve) do
      {:ok, manifest} -> manifest
      _ -> %{}
    end
  end
end
