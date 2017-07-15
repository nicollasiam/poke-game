require 'gosu'

class PokemonMenu
  attr_reader :list

  def initialize(player, controller)
    @list = []

    @list << Button.new(25, 490, 250, 50, player.pokemon_list[0].name, 30, lambda { controller.switch(player.pokemon_list[0]) })
    @list << Button.new(25 + 250, 490, 250, 50, player.pokemon_list[1].name, 30, lambda { puts "#{player.pokemon_list[1].name}" })
    @list << Button.new(25 + 500, 490, 250, 50, player.pokemon_list[2].name, 30, lambda { puts "#{player.pokemon_list[2].name}" })
    @list << Button.new(25, 490 + 50, 250, 50, player.pokemon_list[3].name, 30, lambda { puts "#{player.pokemon_list[3].name}" })
    @list << Button.new(25 + 250, 490 + 50, 250, 50, player.pokemon_list[4].name, 30, lambda { puts "#{player.pokemon_list[4].name}" })
    @list << Button.new(25 + 500, 490 + 50, 250, 50, player.pokemon_list[5].name, 30, lambda { puts "#{player.pokemon_list[5].name}" })
  end

  def draw
    @list.each(&:draw)
  end
end
