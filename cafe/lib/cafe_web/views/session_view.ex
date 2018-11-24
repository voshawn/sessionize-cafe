defmodule CafeWeb.SessionView do
  use CafeWeb, :view

  def render("test.json", %{user: user}) do
    %{
      data: %{
        user: user
      }
    }
  end
end
