require 'gosu'
require 'pry'

require_relative 'button'
require_relative 'player_menu'
require_relative 'battle'

class PlayerPokemonList < Gosu::Window
  def initialize(controller, player, msg)
    super(800, 600)
    @controller = controller
    @player = player
    @pokemon_list = @player.pokemon_list
    @player_name = @player.name

    @msg = msg

    unless @msg == "Press BACKPACE to go back"
      @buttons = []

      create_buttons

      @active_button = @buttons[0]
      @active_button_index = 0
      @active_button.activate
    end
  end

  def draw
    Gosu.draw_rect(0, 0, 800, 600, Gosu::Color::BLACK)
    Gosu.draw_rect(5, 5, 790, 590, Gosu::Color::WHITE)
    Gosu.draw_rect(6, 6, 788, 588, Gosu::Color::BLACK)
    Gosu.draw_rect(9, 9, 782, 582, Gosu::Color::WHITE)

    # binding.pry
    Gosu::Font.new(17).draw(@msg, 562, 550, 1.11, 1, 1, Gosu::Color::BLACK)

    show_pokemons

    if @msg == "Press BACKPACE to go back"
      if @player_name.length >= 10
        left = 200
      elsif @player_name.length < 10 && @player_name.length > 5
        left = 250
      else
        left = 320
      end

      Gosu::Font.new(60).draw(@player_name, left, 20, 1.11, 1, 1, Gosu::Color::BLACK)
    else
      Gosu::Font.new(50).draw("#{@player_name}, choose your Pokemon", 50, 20, 1.11, 1, 1, Gosu::Color::BLACK)

      @buttons.each(&:draw)
    end
  end

  def button_down(id)
    unless @msg == "Press BACKPACE to go back"
      if Gosu.button_down?(Gosu::KB_DOWN)
        @active_button.deactivate

        if @active_button_index + 1 >= @buttons.length
          @active_button_index = 0
        else
          @active_button_index += 1
        end

        @active_button = @buttons[@active_button_index]
        @active_button.activate
      elsif Gosu.button_down?(Gosu::KB_UP)
        @active_button.deactivate

        if @active_button_index - 1 < 0
          @active_button_index = @buttons.length - 1
        else
          @active_button_index -= 1
        end

        @active_button = @buttons[@active_button_index]
        @active_button.activate
      end
    end

    if Gosu.button_down?(Gosu::KB_ENTER) || Gosu.button_down?(Gosu::KB_RETURN)
      @active_button.execute_action
    elsif Gosu.button_down?(Gosu::KB_BACKSPACE)
      if @controller.battle_began
        # Do nothing
      else
        show_players
      end
    end
  end

  private

  def show_pokemons
    @pokemon_list.each_with_index do |pokemon, index|

      # Print pokemon names
      if @msg == "Press BACKSPACE to go back"
        font = Gosu::Font.new(30)
        font.draw("#{pokemon.name}", 80, 180 + (index - 1) * 70, 1.11, 1, 1, Gosu::Color::BLACK)
      end

      # Print separator line
      Gosu.draw_line(80, 175 + (index - 1) * 70, Gosu::Color::BLACK, 760, 175 + (index - 1) * 70, Gosu::Color::BLACK)
      # Draw one more line at the end
      Gosu.draw_line(80, 175 + index * 70, Gosu::Color::BLACK, 760, 175 + index * 70, Gosu::Color::BLACK) if index == @pokemon_list.length - 1

      # Print pokemon stats
      font = Gosu::Font.new(17)
      font.draw("HP: #{pokemon.hp}", 260, 180 + (index - 1) * 70, 1.11, 1, 1, Gosu::Color::BLACK)
      font.draw("ATK: #{pokemon.atk}", 340, 180 + (index - 1) * 70, 1.11, 1, 1, Gosu::Color::BLACK)
      font.draw("DEF: #{pokemon.def}", 420, 180 + (index - 1) * 70, 1.11, 1, 1, Gosu::Color::BLACK)
      font.draw("SPD: #{pokemon.spd}", 500, 180 + (index - 1) * 70, 1.11, 1, 1, Gosu::Color::BLACK)
      # Print line to separate from attacks
      Gosu.draw_line(255, 200 + (index - 1) * 70, Gosu::Color::BLACK, 760, 200 + (index - 1) * 70, Gosu::Color::BLACK)

      # Print pokemon attacks
      font = Gosu::Font.new(17)
      font.draw("#{pokemon.attacks[0][:name]}: #{pokemon.attacks[0][:PP]}PP", 260, 205 + (index - 1) * 70, 1.11, 1, 1, Gosu::Color::BLACK)
      font.draw("#{pokemon.attacks[1][:name]}: #{pokemon.attacks[1][:PP]}PP", 260, 225 + (index - 1) * 70, 1.11, 1, 1, Gosu::Color::BLACK)
      font.draw("#{pokemon.attacks[2][:name]}: #{pokemon.attacks[2][:PP]}PP", 460, 205 + (index - 1) * 70, 1.11, 1, 1, Gosu::Color::BLACK)
      font.draw("#{pokemon.attacks[3][:name]}: #{pokemon.attacks[3][:PP]}PP", 460, 225 + (index - 1) * 70, 1.11, 1, 1, Gosu::Color::BLACK)
    end
  end

  def create_buttons
    @pokemon_list.each_with_index do |pokemon, index|
      if @controller.battle_began
        @buttons << Button.new(80, 180 + (index - 1) * 70, 170, 60, pokemon.name, 30, lambda { @player.switch_pokemon(index); Battle.new(@controller).show } )
      else
        @buttons << Button.new(80, 180 + (index - 1) * 70, 170, 60, pokemon.name, 30, lambda { @player.switch_pokemon(index); close } )
      end
    end
  end

  def show_players
    PlayerMenu.new(@controller).show
  end
end
