require 'pry'
require 'gosu'
require_relative 'battle'

class Button
  def initialize(x, y, width, height, text, text_size, callback)
    @x = x
    @y = y
    @width = width
    @height = height
    @color = Gosu::Color::WHITE
    @font = Gosu::Font.new(text_size)
    @text = text
    @callback = callback
  end

  def draw
    Gosu.draw_rect(@x, @y, @width, @height, @color, 1.1)
    @font.draw("#{@text}", @x + 10, @y + 15, 1.11, 1, 1, Gosu::Color::BLACK)
  end

  def activate
    @color = Gosu::Color.new(200, 0, 255, 255)
  end

  def deactivate
    @color = Gosu::Color::WHITE
  end

  def execute_action
    @callback.call
  end

end
