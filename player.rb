require 'gosu'

class Player
  def initialize(imgpath, x, y, scale_x, scale_y)
    @x = x
    @y = y
    @scale_x = scale_x
    @scale_y = scale_y
    @sprite = Gosu::Image.new(imgpath)
  end

  def draw
    @sprite.draw(@x, @y, 0, @scale_x, @scale_y)
  end
end
