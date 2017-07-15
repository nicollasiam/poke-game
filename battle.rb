require 'gosu'
require_relative 'player'
require_relative 'button'
require_relative 'main_menu'

require_relative 'battle_manager'
require_relative 'poke_controller'
require_relative 'attack_menu'
require_relative 'pokemon_menu'
require_relative 'player_pokemon_list'

class Battle < Gosu::Window
  def initialize(controller)
    super(800, 600)
    @controller = controller

    self.caption = "#{@controller.active_players.first.name} VS #{@controller.active_players.last.name}"

    @background_image = Gosu::Image.new("media/floor_stadium.png", tileable: true)

    @player1_pokemon = Player.new(@controller.active_players.first.active_pokemon.image_back, -70, 150, 5, 5)
    @player1_health_bar = 200
    @player1_health_bar_color = Gosu::Color::GREEN

    @player2_pokemon = Player.new(@controller.active_players.last.active_pokemon.image_front, 500, 100, 2, 2)
    @player2_health_bar = 200
    @player2_health_bar_color = Gosu::Color::GREEN

    # Decides who starts base on active pokemon speed
    if @controller.active_players.first.active_pokemon.spd >= @controller.active_players.last.active_pokemon.spd
      @active_player = @controller.active_players.first
      @queue_player = @controller.active_players.last
    else
      @active_player = @controller.active_players.last
      @queue_player = @controller.active_players.first
    end

    @options = []

    reload_screen

    # @buttons = MainMenu.new(Button.new(25, 490, 375, 100, "Attack", 50, lambda { @buttons = AttackMenu.new(@controller, @active_player, @queue_player).buttons }),
    #                         Button.new(25 + 375, 490, 375, 100, "Pokemon", 50, lambda { PlayerPokemonList.new(@controller, @active_player, "#{@active_player.name}, switch your pokemon").show })).buttons

    # @active_button = @buttons.first
    # @active_button.activate
    # @active_button_index = 0
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, 0)
    @player1_pokemon.draw
    @player2_pokemon.draw

    Gosu.draw_rect(0, 480, 800, 120, Gosu::Color::WHITE, 1)
    Gosu.draw_rect(12.5, 485, 775, 110, Gosu::Color::BLACK, 1.05)
    Gosu.draw_rect(13.5, 486, 773, 108, Gosu::Color::WHITE, 1.05)

    # Draw Health Bars
    Gosu.draw_rect(22, 197, 206, 31, Gosu::Color::BLACK, 1.12)
    Gosu.draw_rect(25, 200, 200, 25, Gosu::Color::WHITE, 1.12)
    Gosu.draw_rect(25, 200, @player1_health_bar, 25, @player1_health_bar_color, 1.12)

    Gosu.draw_rect(497, 67, 206, 31, Gosu::Color::BLACK, 1.12)
    Gosu.draw_rect(500, 70, 200, 25, Gosu::Color::WHITE, 1.12)
    Gosu.draw_rect(500, 70, @player2_health_bar, 25, @player2_health_bar_color, 1.12)

    @buttons.each(&:draw)
  end

  def button_down(id)
    if Gosu.button_down?(Gosu::KB_RIGHT)
      @active_button.deactivate
      @active_button_index += 1

      # Active was last button, go back to the first
      @active_button_index = 0 if @active_button_index == @buttons.length

      @active_button = @buttons[@active_button_index]
      @active_button.activate
    elsif Gosu.button_down?(Gosu::KB_LEFT)
      @active_button.deactivate
      @active_button_index -= 1

      # Active was the first button, go to the last
      @active_button_index = @buttons.length - 1 if @active_button_index == -1

      @active_button = @buttons[@active_button_index]
      @active_button.activate
    elsif Gosu.button_down?(Gosu::KB_DOWN)
      @active_button.deactivate

      if @active_button_index + (@buttons.length / 2) >= @buttons.length
        @active_button_index -= (@buttons.length / 2)
      else
        @active_button_index += (@buttons.length / 2)
      end

      @active_button = @buttons[@active_button_index]
      @active_button.activate
    elsif Gosu.button_down?(Gosu::KB_UP)
      @active_button.deactivate

      if @active_button_index - (@buttons.length / 2) < 0
        @active_button_index += (@buttons.length / 2)
      else
        @active_button_index -= (@buttons.length / 2)
      end

      @active_button = @buttons[@active_button_index]
      @active_button.activate
    elsif Gosu.button_down?(Gosu::KB_BACKSPACE)
      reload_screen
    elsif Gosu.button_down?(Gosu::KB_ENTER) || Gosu.button_down?(Gosu::KB_RETURN)

      if @buttons.length == 2 # 2 buttons is at the first pokemon_menu
        @buttons = @active_button.execute_action
      else
        attacked = @active_button.execute_action
        @active_button = @buttons.first
        @active_button.activate
        @active_button_index = 0
        if attacked
          switch_players
          reload_screen
        end
      end
    end
  end

  private

  def switch_players
    if @active_player == @controller.active_players.first
      @active_player = @controller.active_players.last
      @queue_player = @controller.active_players.first
    else
      @active_player = @controller.active_players.first
      @queue_player = @controller.active_players.last
    end
  end

  def reload_screen
    @buttons = MainMenu.new(Button.new(25, 490, 375, 100, "Attack", 50, lambda { @buttons = AttackMenu.new(@controller, @active_player, @queue_player).buttons }),
                            Button.new(25 + 375, 490, 375, 100, "Pokemon", 50, lambda { PlayerPokemonList.new(@controller, @active_player, "#{@active_player.name}, switch your pokemon").show })).buttons

    @active_button = @buttons.first
    @active_button.activate
    @active_button_index = 0

    # Update Player 1 Health Bars
    @player1_health_bar = 200 * (@controller.active_players.first.active_pokemon.current_hp / @controller.active_players.first.active_pokemon.hp)

    if @player1_health_bar >= 200 * 0.8
      @player1_health_bar_color = Gosu::Color::GREEN
    elsif @player1_health_bar >= 200 * 0.4 && @player1_health_bar < 200 * 0.8
      @player1_health_bar_color = Gosu::Color::YELLOW
    else
      @player1_health_bar_color = Gosu::Color::RED
    end

    # Update Player 2 Health Bars
    @player2_health_bar = 200 * (@controller.active_players.last.active_pokemon.current_hp / @controller.active_players.last.active_pokemon.hp)

    if @player2_health_bar >= 200 * 0.8
      @player2_health_bar_color = Gosu::Color::GREEN
    elsif @player2_health_bar >= 200 * 0.4 && @player2_health_bar < 200 * 0.8
      @player2_health_bar_color = Gosu::Color::YELLOW
    else
      @player2_health_bar_color = Gosu::Color::RED
    end


    p "#{@queue_player.active_pokemon.name}: #{@queue_player.active_pokemon.current_hp}"
    p "#{@active_player.active_pokemon.name}: #{@active_player.active_pokemon.current_hp}"
  end
end
