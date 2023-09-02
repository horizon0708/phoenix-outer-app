defmodule OuterAppWeb.ExamplePlug do
  def init(args), do: args
  import Plug.Conn

  def call(
        conn,
        _
      ) do
    conn
    # can assign values to conn and pass it to the inner_app's controllers
    |> assign(:outer_assign, "outer_assign")

    # you can also assign modules and invoke functions from the inner_app
    |> assign(:outer_module, OuterAppWeb.SomeModule)

    # you can pass view into the inner app, so that outer app can "theme" the inner app
    |> assign(:outer_view, OuterAppWeb.PageHTML)

    # of course you can use plugs to do things like authentication etc.
    # This lets core inner_app remains portable, thus self-hostable by users
  end
end

defmodule OuterAppWeb.SomeModule do
  def hello() do
    "hello"
    |> IO.inspect()
  end
end
