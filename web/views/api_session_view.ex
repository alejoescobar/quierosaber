defmodule QuieroSaber.ApiSessionView do
  use QuieroSaber.Web, :view

  # def render("index.json", %{blogs: blogs}) do
  #   %{
  #       blogs: Enum.map(blogs, &blogs_json/1)
  #   }
  # end

  def render("show.json", %{session: session}) do
    %{
      session: sessions_json(session)
    }
  end

  def sessions_json(session) do
    %{
      id: session.id,
      code: session.code
    }
  end
end
