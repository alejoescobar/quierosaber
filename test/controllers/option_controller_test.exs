defmodule QuieroSaber.OptionControllerTest do
  use QuieroSaber.ConnCase

  alias QuieroSaber.Option
  @valid_attrs %{order: 42, title: "some title"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, option_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing options"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, option_path(conn, :new)
    assert html_response(conn, 200) =~ "New option"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, option_path(conn, :create), option: @valid_attrs
    option = Repo.get_by!(Option, @valid_attrs)
    assert redirected_to(conn) == option_path(conn, :show, option.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, option_path(conn, :create), option: @invalid_attrs
    assert html_response(conn, 200) =~ "New option"
  end

  test "shows chosen resource", %{conn: conn} do
    option = Repo.insert! %Option{}
    conn = get conn, option_path(conn, :show, option)
    assert html_response(conn, 200) =~ "Show option"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, option_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    option = Repo.insert! %Option{}
    conn = get conn, option_path(conn, :edit, option)
    assert html_response(conn, 200) =~ "Edit option"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    option = Repo.insert! %Option{}
    conn = put conn, option_path(conn, :update, option), option: @valid_attrs
    assert redirected_to(conn) == option_path(conn, :show, option)
    assert Repo.get_by(Option, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    option = Repo.insert! %Option{}
    conn = put conn, option_path(conn, :update, option), option: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit option"
  end

  test "deletes chosen resource", %{conn: conn} do
    option = Repo.insert! %Option{}
    conn = delete conn, option_path(conn, :delete, option)
    assert redirected_to(conn) == option_path(conn, :index)
    refute Repo.get(Option, option.id)
  end
end
