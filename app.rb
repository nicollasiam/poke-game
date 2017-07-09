require_relative 'battle_manager'
require_relative 'poke_controller'
require_relative 'router'

manager = BattleManager.new
controller = PokeController.new(manager)
router = Router.new(controller)

router.run
