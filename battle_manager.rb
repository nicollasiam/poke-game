require 'pry'

class BattleManager
  def initialize
    @players = []
    @active_players = []
  end

  def add_player(new_player)
    @players << new_player
  end

  def all_players
    @players
  end

  def all_pokemons_from_player(player_index, has_started = false)
    has_started ? trainer = @active_players[player_index] : trainer = @players[player_index]

    trainer.pokemon_list
  end

  def active_player
    @active_players
  end

  def choose_players
    @active_players = @players.sample(2)
  end
end
