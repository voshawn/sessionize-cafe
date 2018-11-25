defmodule CafeWeb.SessionView do
  use CafeWeb, :view

  def render("data.json", %{data: data}) do
    %{
      data: data
    }
  end
end
