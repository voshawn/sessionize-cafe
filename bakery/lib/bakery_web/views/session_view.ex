defmodule BakeryWeb.SessionView do
  use BakeryWeb, :view
  def render("test.json", %{user: user}) do
    %{
      data: %{
        user: user
      }
    }
  end
end

