require 'pry'
require_relative 'pokemon'
require_relative 'pokemon-list'

class Trainer
  attr_reader :pokemon_list, :name, :active_pokemon

  def initialize(name)
    @name = name
    @pokemon_list = [] # Array
    @active_pokemon = nil

    create_pokemon_list
  end

  def switch_pokemon(pokemon_index)
    @active_pokemon = @pokemon_list[pokemon_index]
  end

  def show_pokemon_list
    string = ""

    @pokemon_list.each_with_index do |pokemon, pokemon_index|
      string += "[#{pokemon_index + 1}]: #{pokemon.name}: #{pokemon.hp} HP\n"
    end

    string += "\n"
  end

  def pick_an_attack
    string = ""
    @active_pokemon.attacks.each_with_index do |attack, attack_index|
      string += "[#{attack_index + 1}]: #{attack[:name]}: #{attack[:PP]} PP\n"
    end

    string += "\n"
  end

  def remove_pokemon_fainted
    @pokemon_list.delete_at(@pokemon_list.index(@active_pokemon))
    @active_pokemon = nil
  end

  def active_died?
    @active_pokemon.current_hp <= 0
  end

  def pokemons_available
    @pokemon_list.length
  end

  ##### PRIVATE METHODS #####
  private

  def create_pokemon_list
    while @pokemon_list.length < 6
      pokemon = POKEMONS.sample
      has_pokemon = false

      @pokemon_list.each { |poke| has_pokemon = true if poke.is_a? pokemon }

      @pokemon_list << pokemon.new unless has_pokemon
    end
  end
end
