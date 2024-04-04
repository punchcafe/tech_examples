defmodule EchoSocket do
    @behaviour Phoenix.Socket.Transport
  
    def child_spec(opts) do
      IO.inspect("childspecs")
      # We won't spawn any process, so let's ignore the child spec
      :ignore
    end
  
    def connect(state) do
      IO.inspect(state)
      # Callback to retrieve relevant data from the connection.
      # The map contains options, params, transport and endpoint keys.
      {:ok, state}
    end
  
    def init(state) do
      IO.inspect("connection opened")
      # Now we are effectively inside the process that maintains the socket.
      {:ok, state}
    end
  
    def handle_in({text, _opts}, state) do
      IO.inspect("message in: #{text}")
      {:reply, :ok, {:text, text}, state}
    end
  
    def handle_info(_, state) do
      {:ok, state}
    end
  
    def terminate(_reason, _state) do
      :ok
    end
  end