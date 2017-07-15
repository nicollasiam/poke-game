require 'gosu'

class AttackMenu
  attr_reader :buttons

  def initialize(controller, active_player, queue_player)
    @buttons = []
    @controller = controller

    @active_player = active_player
    @queue_player = queue_player

    @buttons << Button.new(25, 490, 375, 50, @active_player.active_pokemon.attacks[0][:name], 30, lambda { perform_attack(0); return true })
    @buttons << Button.new(25 + 375, 490, 375, 50, @active_player.active_pokemon.attacks[1][:name], 30, lambda { perform_attack(1); return true })
    @buttons << Button.new(25, 490 + 50, 375, 50, @active_player.active_pokemon.attacks[2][:name], 30, lambda { perform_attack(2); return true })
    @buttons << Button.new(25 + 375, 490 + 50, 375, 50, @active_player.active_pokemon.attacks[3][:name], 30, lambda { perform_attack(3); return true })
  end

  private

  def perform_attack(index)
    @controller.attack_enemy(@active_player,
                             @queue_player,
                             @active_player.active_pokemon.attacks[0],
                             index,
                             @queue_player.active_pokemon.def)

    if @queue_player.active_pokemon.current_hp <= 0
      PlayerPokemonList.new(@controller, @queue_player, "#{@queue_player.name}, switch your pokemon").show
    end
  end
end
