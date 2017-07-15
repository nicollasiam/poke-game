require 'gosu'
require_relative 'button'

class MainMenu
  attr_reader :buttons

  def initialize(*buttons)
    @buttons = [buttons.first, buttons.last]
  end
end
