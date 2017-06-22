defmodule Speed.CLI do
  @moduledoc """
  Provides the command-line user interface.
  """

  @doc """
  The main entry point for the escript.
  """
  @spec main([binary]) :: non_neg_integer
  def main(_arguments) do
    IO.puts "WELCOME TO SPEED!"
    IO.puts "THANKS FOR PLAYING."
    0
  end
end
