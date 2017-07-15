require 'gosu'
require 'pry'

require_relative 'button'
require_relative 'first_menu'

class NewPlayerMenu < Gosu::Window
  def initialize(controller)
    super(800, 600)
    self.caption = "Poke Wagon"

    @controller = controller

    @player_name = ""

    @name_font = Gosu::Font.new(55)
    @press_enter_font = Gosu::Font.new(30)
  end

  def draw
    # Beauty Rectangles
    Gosu.draw_rect(0, 0, 800, 600, Gosu::Color::WHITE)
    Gosu.draw_rect(100, 50, 600, 220, Gosu::Color::BLACK)
    Gosu.draw_rect(101, 51, 598, 218, Gosu::Color::WHITE)
    Gosu.draw_rect(106, 56, 588, 206, Gosu::Color::BLACK)
    Gosu.draw_rect(107, 57, 586, 204, Gosu::Color::WHITE)

    # Beauty Rectangles do make the Buttons
    # Create Player Button Box
    Gosu.draw_rect(107 + 38.6, 57 + 20, 508.8, 100, Gosu::Color::BLACK)
    Gosu.draw_rect(107 + 39.6, 57 + 21, 506.8, 98, Gosu::Color::WHITE)
    Gosu.draw_rect(107 + 49.6, 57 + 31, 486.8, 78, Gosu::Color::BLACK)

    Gosu.draw_line(107 + 38.6, 57 + 20, Gosu::Color::BLACK, 107 + 49.6, 57 + 31, Gosu::Color::BLACK) # top left line
    Gosu.draw_line(107 + 38.6, 57 + 20 + 100, Gosu::Color::BLACK, 107 + 49.6, 57 + 31 + 78, Gosu::Color::BLACK) # bot left line
    Gosu.draw_line(107 + 238.6 + 308.8, 57 + 20, Gosu::Color::BLACK, 107 + 249.6 + 286.8, 57 + 31, Gosu::Color::BLACK) # top right line
    Gosu.draw_line(107 + 238.6 + 308.8, 57 + 20 + 100, Gosu::Color::BLACK, 107 + 249.6 + 286.8, 57 + 31 + 78, Gosu::Color::BLACK) # bot right line

    @name_font.draw(@player_name, 107 + 49.6 + 10, 57 + 31 + 15, 1.11, 1, 1, Gosu::Color::WHITE)
    @press_enter_font.draw("Press enter to create you team!", 200, 200, 1.11, 1, 1, Gosu::Color::BLACK)
  end


  def button_down(id)
    if Gosu.button_down?(Gosu::KB_A)
      @player_name += "A"
    elsif Gosu.button_down?(Gosu::KB_B)
      @player_name += "B"
    elsif Gosu.button_down?(Gosu::KB_C)
      @player_name += "C"
    elsif Gosu.button_down?(Gosu::KB_D)
      @player_name += "D"
    elsif Gosu.button_down?(Gosu::KB_E)
      @player_name += "E"
    elsif Gosu.button_down?(Gosu::KB_F)
      @player_name += "F"
    elsif Gosu.button_down?(Gosu::KB_G)
      @player_name += "G"
    elsif Gosu.button_down?(Gosu::KB_H)
      @player_name += "H"
    elsif Gosu.button_down?(Gosu::KB_I)
      @player_name += "I"
    elsif Gosu.button_down?(Gosu::KB_J)
      @player_name += "J"
    elsif Gosu.button_down?(Gosu::KB_K)
      @player_name += "K"
    elsif Gosu.button_down?(Gosu::KB_L)
      @player_name += "L"
    elsif Gosu.button_down?(Gosu::KB_M)
      @player_name += "M"
    elsif Gosu.button_down?(Gosu::KB_N)
      @player_name += "N"
    elsif Gosu.button_down?(Gosu::KB_O)
      @player_name += "O"
    elsif Gosu.button_down?(Gosu::KB_P)
      @player_name += "P"
    elsif Gosu.button_down?(Gosu::KB_Q)
      @player_name += "Q"
    elsif Gosu.button_down?(Gosu::KB_R)
      @player_name += "R"
    elsif Gosu.button_down?(Gosu::KB_S)
      @player_name += "S"
    elsif Gosu.button_down?(Gosu::KB_T)
      @player_name += "T"
    elsif Gosu.button_down?(Gosu::KB_U)
      @player_name += "U"
    elsif Gosu.button_down?(Gosu::KB_V)
      @player_name += "V"
    elsif Gosu.button_down?(Gosu::KB_W)
      @player_name += "W"
    elsif Gosu.button_down?(Gosu::KB_X)
      @player_name += "X"
    elsif Gosu.button_down?(Gosu::KB_Y)
      @player_name += "Y"
    elsif Gosu.button_down?(Gosu::KB_Z)
      @player_name += "Z"
    elsif Gosu.button_down?(Gosu::KB_SPACE)
      @player_name += " "
    elsif Gosu.button_down?(Gosu::KB_BACKSPACE)
      @player_name = @player_name[0..-2]
    elsif Gosu.button_down?(Gosu::KB_ENTER) || Gosu.button_down?(Gosu::KB_RETURN)
      @controller.create_player(@player_name)
      show_first_menu
    end
  end

  private

  def show_first_menu
    FirstMenu.new(@controller).show
  end
end
