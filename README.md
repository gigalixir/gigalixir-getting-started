Gigalixir Getting Started
--

This is a getting started project for [Gigalixir](https://www.gigalixir.com).

This repo was built using the 
[Phoenix deploy with Releases](https://www.gigalixir.com/docs/getting-started-guide/phoenix-releases-deploy).

## Deploying

Create your gigalixir application:
```
APP_NAME=$(gigalixir create)
```

Phoenix now requires a database, so let's create one:
```
gigalixir pg:create --free
```

Phoenix also needs this config:
```
gigalixir config:set PHX_HOST=${APP_NAME}.gigalixirapp.com PHX_SERVER=true
```

Now you can deploy:
```
git push -u gigalixir main
```

**NOTE:** If you plan to use this for a production environment, you will need to rotate the `signing_salt` in [config/config.exs] and [lib/gigalixir_getting_started_web/endpoint.ex].

If you have any questions, don't hesitate to reach out to [Gigalixir support](mailto:support@gigalixir.com).


## Phoenix

### Development

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

### Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
