require 'gosu'
require 'pry'

require_relative 'button'
require_relative 'new_player_menu'
require_relative 'player_menu'

require_relative 'battle_manager'
require_relative 'poke_controller'

class FirstMenu < Gosu::Window
  def initialize(controller)
    super(800, 600)
    self.caption = "Poke Wagon"

    @controller = controller

    @add_trainer_button = Button.new(207 + 50.6, 57 + 32, 284.8, 76, "Add Trainer", 55, lambda { show_new_player_menu })
    @show_pokemon_button = Button.new(207 + 50.6, 57 + 152, 284.8, 76, "Show Pkmn", 55, lambda { show_players })
    @begin_battle_button = Button.new(207 + 50.6, 57 + 272, 284.8, 76, "Begin Battle", 55, lambda { begin_battle })
    @exit_game_button = Button.new(207 + 50.6, 57 + 392, 284.8, 76, "Exit Game", 55, lambda { close })

    @buttons = [@add_trainer_button, @show_pokemon_button, @begin_battle_button, @exit_game_button]

    @active_button = @add_trainer_button
    @active_button_index = 0
    @active_button.activate
  end

  def draw
    # Beauty Rectangles
    Gosu.draw_rect(0, 0, 800, 600, Gosu::Color::WHITE)
    Gosu.draw_rect(200, 50, 400, 520, Gosu::Color::BLACK)
    Gosu.draw_rect(201, 51, 398, 518, Gosu::Color::WHITE)
    Gosu.draw_rect(206, 56, 388, 506, Gosu::Color::BLACK)
    Gosu.draw_rect(207, 57, 386, 504, Gosu::Color::WHITE)

    # Beauty Rectangles do make the Buttons
    # Create Player Button Box
    Gosu.draw_rect(207 + 38.6, 57 + 20, 308.8, 100, Gosu::Color::BLACK)
    Gosu.draw_rect(207 + 39.6, 57 + 21, 306.8, 98, Gosu::Color::WHITE)
    Gosu.draw_rect(207 + 49.6, 57 + 31, 286.8, 78, Gosu::Color::BLACK)

    Gosu.draw_line(207 + 38.6, 57 + 20, Gosu::Color::BLACK, 207 + 49.6, 57 + 31, Gosu::Color::BLACK) # top left line
    Gosu.draw_line(207 + 38.6, 57 + 20 + 100, Gosu::Color::BLACK, 207 + 49.6, 57 + 31 + 78, Gosu::Color::BLACK) # bot left line
    Gosu.draw_line(207 + 38.6 + 308.8, 57 + 20, Gosu::Color::BLACK, 207 + 49.6 + 286.8, 57 + 31, Gosu::Color::BLACK) # top right line
    Gosu.draw_line(207 + 38.6 + 308.8, 57 + 20 + 100, Gosu::Color::BLACK, 207 + 49.6 + 286.8, 57 + 31 + 78, Gosu::Color::BLACK) # bot right line

    @add_trainer_button.draw

    # Begin Battle Button Box
    Gosu.draw_rect(207 + 38.6, 57 + 140, 308.8, 100, Gosu::Color::BLACK)
    Gosu.draw_rect(207 + 39.6, 57 + 141, 306.8, 98, Gosu::Color::WHITE)
    Gosu.draw_rect(207 + 49.6, 57 + 151, 286.8, 78, Gosu::Color::BLACK)

    Gosu.draw_line(207 + 38.6, 57 + 140, Gosu::Color::BLACK, 207 + 49.6, 57 + 151, Gosu::Color::BLACK) # top left line
    Gosu.draw_line(207 + 38.6, 57 + 140 + 100, Gosu::Color::BLACK, 207 + 49.6, 57 + 151 + 78, Gosu::Color::BLACK) # bot left line
    Gosu.draw_line(207 + 38.6 + 308.8, 57 + 140, Gosu::Color::BLACK, 207 + 49.6 + 286.8, 57 + 151, Gosu::Color::BLACK) # top right line
    Gosu.draw_line(207 + 38.6 + 308.8, 57 + 140 + 100, Gosu::Color::BLACK, 207 + 49.6 + 286.8, 57 + 151 + 78, Gosu::Color::BLACK) # bot right line

    @show_pokemon_button.draw

    # Begin Battle Button Box
    Gosu.draw_rect(207 + 38.6, 57 + 260, 308.8, 100, Gosu::Color::BLACK)
    Gosu.draw_rect(207 + 39.6, 57 + 261, 306.8, 98, Gosu::Color::WHITE)
    Gosu.draw_rect(207 + 49.6, 57 + 271, 286.8, 78, Gosu::Color::BLACK)

    Gosu.draw_line(207 + 38.6, 57 + 260, Gosu::Color::BLACK, 207 + 49.6, 57 + 271, Gosu::Color::BLACK) # top left line
    Gosu.draw_line(207 + 38.6, 57 + 260 + 100, Gosu::Color::BLACK, 207 + 49.6, 57 + 271 + 78, Gosu::Color::BLACK) # bot left line
    Gosu.draw_line(207 + 38.6 + 308.8, 57 + 260, Gosu::Color::BLACK, 207 + 49.6 + 286.8, 57 + 271, Gosu::Color::BLACK) # top right line
    Gosu.draw_line(207 + 38.6 + 308.8, 57 + 260 + 100, Gosu::Color::BLACK, 207 + 49.6 + 286.8, 57 + 271 + 78, Gosu::Color::BLACK) # bot right line

    @begin_battle_button.draw

    # Exit Game Button Box
    Gosu.draw_rect(207 + 38.6, 57 + 380, 308.8, 100, Gosu::Color::BLACK)
    Gosu.draw_rect(207 + 39.6, 57 + 381, 306.8, 98, Gosu::Color::WHITE)
    Gosu.draw_rect(207 + 49.6, 57 + 391, 286.8, 78, Gosu::Color::BLACK)

    Gosu.draw_line(207 + 38.6, 57 + 380, Gosu::Color::BLACK, 207 + 49.6, 57 + 391, Gosu::Color::BLACK) # top left line
    Gosu.draw_line(207 + 38.6, 57 + 380 + 100, Gosu::Color::BLACK, 207 + 49.6, 57 + 391 + 78, Gosu::Color::BLACK) # bot left line
    Gosu.draw_line(207 + 38.6 + 308.8, 57 + 380, Gosu::Color::BLACK, 207 + 49.6 + 286.8, 57 + 391, Gosu::Color::BLACK) # top right line
    Gosu.draw_line(207 + 38.6 + 308.8, 57 + 380 + 100, Gosu::Color::BLACK, 207 + 49.6 + 286.8, 57 + 391 + 78, Gosu::Color::BLACK) # bot right line

    @exit_game_button.draw
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
    elsif Gosu.button_down?(Gosu::KB_BACKSPACE) || Gosu.button_down?(Gosu::KB_ENTER) || Gosu.button_down?(Gosu::KB_RETURN)
      @active_button.execute_action
    end
  end

  private

  def show_new_player_menu
    NewPlayerMenu.new(@controller).show
  end

  def begin_battle
    # Selecionar os players
    @controller.select_players

    @controller.active_players.each do |player|
      show_player_pokemon_list(player)
    end

    @controller.battle_began = true
    Battle.new(@controller).show
  end

  def show_players
    PlayerMenu.new(@controller).show
  end

  def show_player_pokemon_list(player)
    poke_list_window = PlayerPokemonList.new(@controller, player, "Choose your starting Pokemon")
    poke_list_window.show
  end
end
