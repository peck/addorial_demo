defmodule MeetupDemo.AddorialController do
  use MeetupDemo.Web, :controller

  def show(conn, params = %{"id" => id}) when byte_size(id) <= 20 do
    {_whatever, ret} = Cachex.get(:addorial_cache, id, fallback: fn(id) ->
      id
      |> String.to_integer()
      |> Addorial.of()

    end)

    json conn, %{val: id, addorial: ret}
  end

  def show(conn, params = %{"id" => id}) when byte_size(id) > 20 do
    json conn, %{val: id, addorial: "http://www.urbandictionary.com/define.php?term=slow%20your%20roll"}
  end
end
