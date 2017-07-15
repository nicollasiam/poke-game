require_relative 'battle_manager'
require_relative 'poke_controller'
require_relative 'router'

require_relative 'battle'
require_relative 'first_menu'

manager = BattleManager.new
controller = PokeController.new(manager)
# graphics = PokeWagon.new(controller)
graphics = FirstMenu.new(controller)

graphics.show

#router = Router.new(controller)
#router.run
