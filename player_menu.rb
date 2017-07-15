require 'gosu'
require 'pry'

require_relative 'button'
require_relative 'first_menu'
require_relative 'player_pokemon_list'

class PlayerMenu < Gosu::Window
  def initialize(controller)
    super(800, 600)

    @controller = controller
    @players = @controller.get_all_players

    @buttons = []
    create_buttons
    @active_button = @buttons[1]
    @active_button_index = 1
    @active_button.activate
  end

  def draw
    Gosu.draw_rect(0, 0, 800, 600, Gosu::Color::BLACK)
    Gosu.draw_rect(5, 5, 790, 590, Gosu::Color::WHITE)
    Gosu.draw_rect(6, 6, 788, 588, Gosu::Color::BLACK)
    Gosu.draw_rect(9, 9, 782, 582, Gosu::Color::WHITE)

    @buttons.each_with_index do |button, index|
      unless index.zero?
        Gosu.draw_rect(30, 30 + (index - 1) * 50 + (index - 1) * 20, 202, 52, Gosu::Color::BLACK)
        Gosu.draw_rect(31, 30 + (index - 1) * 50 + (index - 1) * 20 + 1, 200, 50, Gosu::Color::WHITE)
      end

      button.draw
    end
  end

  def button_down(id)
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
    elsif Gosu.button_down?(Gosu::KB_ENTER) || Gosu.button_down?(Gosu::KB_RETURN)
      @active_button.execute_action
    end
  end

  private

  def create_buttons
    # back_button
    @buttons << Button.new(700, 520, 50, 50, "Back", 30, lambda { show_first_menu })

    @players.each_with_index do |player, index|
      @buttons << Button.new(31, 30 + index * 50 + index * 20 + 1, 200, 50, player.name, 30, lambda { show_player_pokemon_list(index, player) })
    end
  end

  def show_player_pokemon_list(index, player)
    poke_list_window = PlayerPokemonList.new(@controller, player, "Press BACKPACE to go back")
    poke_list_window.show
  end

  def show_first_menu
    FirstMenu.new(@controller).show
  end
end
