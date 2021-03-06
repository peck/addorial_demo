defmodule MeetupDemo.Router do
  use MeetupDemo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

   scope "/", MeetupDemo do
     pipe_through :api
     resources "factorial", FactorialController, only: [:show]
     resources "addorial", AddorialController, only: [:show]
  end
end
