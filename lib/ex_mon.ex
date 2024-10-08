defmodule ExMon do
  alias ExMon.Game.Actions
  alias ExMon.{Game, Player}
  alias ExMon.Game.Status

  @computer_name "Robotinik"

  def create_player(name, move_rnd, move_avg, move_heal) do
    Player.build(name, move_rnd, move_avg, move_heal)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message()
  end

  def make_move(move) do
    move |> Actions.fetch_move() |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)
end
