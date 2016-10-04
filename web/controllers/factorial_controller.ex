defmodule MeetupDemo.FactorialController do
  use MeetupDemo.Web, :controller

  def show(conn, params = %{"id" => id}) when byte_size(id) <= 4 do
    {_whatever, ret} = Cachex.get(:factorial_cache, id, fallback: fn(id) ->
      id
      |> String.to_integer()
      |> Factorial.of()

      end)

    json conn, %{val: id, factorial: ret}
  end

  def show(conn, params = %{"id" => id}) when byte_size(id) > 4 do
    json conn, %{val: id, factorial: "http://www.urbandictionary.com/define.php?term=slow%20your%20roll"}
  end
end
