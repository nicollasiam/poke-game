require_relative 'interface'
require_relative 'trainer'

require 'pry'

class PokeController
  attr_accessor :battle_began
  attr_reader :active_players

  def initialize(battle_manager)
    @interface = Interface.new
    @battle_manager = battle_manager

    @battle_began = false

    @active_players = nil
  end

  def get_all_active_players
    active_players = @battle_manager.active_players
  end

  def get_all_players
    @battle_manager.all_players
  end

  def list_player_team(player_index)
    # all_players = @battle_manager.all_players
    # @interface.show_all_players(all_players)
    # player_index = @interface.get_player_index
    @battle_manager.all_pokemons_from_player(player_index)
    # @interface.show_all_pokemons(pokemon_list)
  end

  def create_player(player_name)
    @battle_manager.add_player(Trainer.new(player_name))
  end

  def select_players
    @active_players = @battle_manager.choose_players
  end

  def begin_battle
    # Decidir quais jogadores irão batalhar
    # @interface.show_active_players(active_players)

    player1 = @active_players.first
    player2 = @active_players.last

    # Mostrar os pokemons do player 1
    # @interface.show_player_name(player1)
    # @interface.show_all_pokemons(player1.pokemon_list)
    # Escolher o pokemon que irá começar
    # pokemon_index = @interface.get_pokemon_index
    player1.switch_pokemon(pokemon_index)

    # Mostrar os pokemons do player 2
    # @interface.show_player_name(player2)
    # @interface.show_all_pokemons(player2.pokemon_list)
    # Escolher o pokemon que irá começar
    # pokemon_index = @interface.get_pokemon_index
    player2.switch_pokemon(pokemon_index)

    # Mostrar os pokemons escolhidos dos players
    # @interface.show_players_active_pokemons(player1, player2)


    loop do
      player1_option = -3
      player2_option = -3

      player1_attack = 4
      player2_attack = 4
      # Escolher o ataque do player 1 ou trocar de pokemon
      loop do
        # Loop until choose an attack with enough PP ou switch pokemon
        # player1_option = @interface.ask_for_attack_or_switch(player1)

        case player1_option
        when -1
          # @interface.show_all_pokemons(player1.pokemon_list)
          # pokemon_index = @interface.get_pokemon_index
          player1.switch_pokemon(pokemon_index)
        when 0, 1, 2, 3
          player1_attack = player1.active_pokemon.attacks[player1_option]
        end

        break if player1_option == -1 || player1.active_pokemon.attacks[player1_option][:PP] > 0

        # @interface.no_pp_left_message
      end

      # Escolher o ataque do player 2 ou trocar de pokemon
      loop do
        # Loop until choose an attack with enough PP ou switch pokemon
        # player2_option = @interface.ask_for_attack_or_switch(player2)
        case player2_option
        when -1
          # @interface.show_all_pokemons(player2.pokemon_list)
          # pokemon_index = @interface.get_pokemon_index
          player2.switch_pokemon(pokemon_index)
        when 0, 1, 2, 3
          player2_attack = player2.active_pokemon.attacks[player2_option]
        end

        break if player2_option == -1 || player2.active_pokemon.attacks[player2_option][:PP] > 0

        # @interface.no_pp_left_message

      end

      # @interface.prepare_for_next_round
      # Verificar ações
      if player1_option == -1 && player2_option == -1
        # Mensagem sobre a troca de pokemon do player1
        # @interface.communicate_switch(player1)
        # Mensagem sobre a troca de pokemon do player2
        # @interface.communicate_switch(player2)
      elsif player1_option == -1 # Player1 trocou de pokemon
        # Mensagem sobre a troca de pokemon do player1
        # @interface.communicate_switch(player1)
        # Remove 1 PP
        player2.active_pokemon.reduce_pp(player2_option)
        # Verificar dano do player 2
        player2_damage = player2.active_pokemon.attack(player2_attack, player1.active_pokemon.def)
        # Show attack used message
        # @interface.attack_used_message(player2.active_pokemon, player2_attack)
        # Check if attack missed or was well succeded
        if player2_damage.zero?
          # Show attack missed message
          # @interface.missed_attack_message
        else
          # Causar dano no pokemon do player1 se não errou
          effectiveness = player1.active_pokemon.defend(player2_attack, player2_damage)
          # Show effectiveness message
          # @interface.effectiveness_message(effectiveness)
        end
        # Verificar se pokemon do player1 morreu.
        if player1.active_died?
          # Inform death
          # @interface.pokemon_died(player1.active_pokemon)
          # Remove current pokemon from player list
          player1.remove_pokemon_fainted
          # Check pokemons still available
          if player1.pokemons_available > 0
            # Ask for another pokemon
            # @interface.show_all_pokemons(player1.pokemon_list)
            # pokemon_index = @interface.get_pokemon_index
            player1.switch_pokemon(pokemon_index)
          end
        end
      elsif player2_option == -1 # Player2 trocou de pokemon
        # Mensagem sobre a troca de pokemon do player2
        # @interface.communicate_switch(player2)
        # Remove 1 PP
        player1.active_pokemon.reduce_pp(player1_option)
        # Verificar dano do player 1
        player1_damage = player1.active_pokemon.attack(player1_attack, player2.active_pokemon.def)
        # Show attack used message
        # @interface.attack_used_message(player1.active_pokemon, player1_attack)
        # Check if attack missed or was well succeded
        if player1_damage.zero?
          # Show attack missed message
          # @interface.missed_attack_message
        else
          # Causar dano no pokemon do player2 se não errou
          effectiveness = player2.active_pokemon.defend(player1_attack, player1_damage)
          # Show effectiveness message
          # @interface.effectiveness_message(effectiveness)
        end
        # Verificar se pokemon do player2 morreu.
        if player2.active_died?
          # Inform death
          # @interface.pokemon_died(player1.active_pokemon)
          # Remove current pokemon from player list
          player2.remove_pokemon_fainted
          # Check pokemons still available
          if player2.pokemons_available > 0
            # Ask for another pokemon
            # @interface.show_all_pokemons(player2.pokemon_list)
            # pokemon_index = @interface.get_pokemon_index
            player2.switch_pokemon(pokemon_index)
          end
        end
      else # Ninguem trocou de pokemon
        # Verificar quem ataca primeiro



        ############ FIRST PLAYER ROUND ############
        # Remove 1 PP
        player1.active_pokemon.reduce_pp(player1_option)
        # Verificar dano do player 1
        player1_damage = player1.active_pokemon.attack(player1_attack, player2.active_pokemon.def)
        # Show attack used message
        # @interface.attack_used_message(player1.active_pokemon, player1_attack)
        # Check if attack missed or was well succeded
        if player1_damage.zero?
          # Show attack missed message
          # @interface.missed_attack_message
        else
          # Causar dano no pokemon do player2 se não errou
          effectiveness = player2.active_pokemon.defend(player1_attack, player1_damage)
          # Show effectiveness message
          # @interface.effectiveness_message(effectiveness)
        end
        # Verificar se pokemon do player2 morreu.
        if player2.active_died?
          # Inform death
          # @interface.pokemon_died(player2.active_pokemon)
          # Remove current pokemon from player list
          player2.remove_pokemon_fainted
          # Check pokemons still available
          if player2.pokemons_available > 0
            # Ask for another pokemon
            # @interface.show_all_pokemons(player2.pokemon_list)
            # pokemon_index = @interface.get_pokemon_index
            player2.switch_pokemon(pokemon_index)
          end
        else







          ############ SECOND PLAYER ROUND ############
          # Remove 1 PP
          player2.active_pokemon.reduce_pp(player2_option)
          # Verificar dano do player 2
          player2_damage = player2.active_pokemon.attack(player2_attack, player1.active_pokemon.def)
          # Show attack used message
          # @interface.attack_used_message(player2.active_pokemon, player2_attack)
          # Check if attack missed or was well succeded
          if player2_damage.zero?
            # Show attack missed message
            # @interface.missed_attack_message
          else
            # Causar dano no pokemon do player1 se não errou
            effectiveness = player1.active_pokemon.defend(player2_attack, player2_damage)
            # Show effectiveness message
            # @interface.effectiveness_message(effectiveness)
          end
          # Verificar se pokemon do player1 morreu.
          if player1.active_died?
            # Inform death
            # @interface.pokemon_died(player1.active_pokemon)
            # Remove current pokemon from player list
            player1.remove_pokemon_fainted
            # Check pokemons still available
            if player1.pokemons_available > 0
              # Ask for another pokemon
              # @interface.show_all_pokemons(player1.pokemon_list)
              # pokemon_index = @interface.get_pokemon_index
              player1.switch_pokemon(pokemon_index)
            end
          end
        end
      end

      break if player1.active_pokemon.nil? || player2.active_pokemon.nil?

      # @interface.show_pokemon_hp(player1.active_pokemon)
      # @interface.show_pokemon_hp(player2.active_pokemon)
    end

    # @interface.show_winner(player1, player2)
  end



  def attack_enemy(active_player,
                   queue_player,
                   atk,
                   index,
                   defender_defense_stat)

    # Reduce attacking Pokemon PP
    active_player.active_pokemon.reduce_pp(index)

    # Calculate damage
    damage = active_player.active_pokemon.attack(atk, defender_defense_stat)

    # Calculate damage taken by defending pokemon
    queue_player.active_pokemon.defend(atk, damage)

    return

  end

end
