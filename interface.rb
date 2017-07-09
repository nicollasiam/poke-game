require 'io/console'
require 'pry'

class Interface

  def create_trainer
    p "What is your name, trainer?"
    player_name = gets.chomp
  end

  def show_all_players(players)
    players.each_with_index do |player, index|
      puts "#{index + 1}. #{player.name}"
    end
  end

  def show_all_pokemons(pokemons)
    puts ""
    pokemons.each_with_index do |pokemon, index|
      puts "[#{index + 1}] #{pokemon.name} #{(100 * pokemon.current_hp / pokemon.hp).round(0)}% HP [#{pokemon.type}]"
    end
  end

  def get_player_index
    puts ""
    puts "Which Trainer?"
    gets.chomp.to_i - 1
  end

  def show_active_players(active_players)
    puts "###### PREPARE FOR BATTLE! ######"
    puts ""
    puts "#{active_players.first.name.upcase} VS #{active_players.last.name.upcase}"
  end

  def show_player_name(player)
    puts ""
    puts "###### #{player.name.upcase} ######"
  end

  def get_pokemon_index
    puts ""
    puts "CHOOSE A POKEMON"
    puts ""
    STDIN.noecho(&:gets).chomp.to_i - 1
  end

  def show_players_active_pokemons(player1, player2)
    puts ""
    puts "#{player1.name.upcase} CHOSE #{player1.active_pokemon.name.upcase}!"
    puts "#{player2.name.upcase} CHOSE #{player2.active_pokemon.name.upcase}!"
  end

  def ask_for_attack_or_switch(player)
    puts ""
    puts "#{player.name.upcase}, CHOOSE YOUR ATTACK OR PRESS 'S' TO SWITCH YOUR POKEMON!"

    player.active_pokemon.attacks.each_with_index do |attack, index|
      puts "[#{index + 1}] #{attack[:name]} *#{attack[:type]}* #{attack[:PP]}PP"
    end

    # to_i em um character retorna 0
    STDIN.noecho(&:gets).chomp.to_i - 1
  end

  def communicate_switch(player)
    puts ""
    puts "#{player.name} SWITCHED TO #{player.active_pokemon.name}!!"
  end

  def attack_used_message(pokemon, attack)
    puts ""
    puts "#{pokemon.name.upcase} USED #{attack[:name].upcase}!"
  end

  def missed_attack_message
    puts "BUT IT MISSED..."
    puts ""
  end

  def effectiveness_message(effectiveness)
    case effectiveness
    when -1
      puts "BUT IT WAS NOT VERY EFFECTIVE..."
    when -2
      puts "BUT IT DOESN'T EFFECT!!"
    when 1
      puts "IT WAS SUPER EFFECTIVE!!"
    end
  end

  def pokemon_died(pokemon)
    puts ""
    puts "#{pokemon.name.upcase} HAS FAINTED!"
  end

  def prepare_for_next_round
    puts `clear`
  end

  def show_pokemon_hp(pokemon)
    puts "#{pokemon.name} IS #{(100 * pokemon.current_hp / pokemon.hp).round(0)}% HP"
  end

  def no_pp_left_message
    puts ""
    puts "THERE IS NO PP LEFT FOR THIS ATTACK!!"
  end

  def show_winner(player1, player2)
    puts ""
    puts "######################################################################"
    puts ""
    if player1.active_pokemon.nil?
      puts "CONGRATULATIONS, #{player1.name.upcase}!! YOU ARE THE WINNER!!"
    else
      puts "CONGRATULATIONS, #{player2.name.upcase}!! YOU ARE THE WINNER!!"
    end
    puts ""
    puts "######################################################################"
  end
end
