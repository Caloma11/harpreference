require_relative 'controller'
require_relative 'harp_all'
require_relative 'router'

controller = Controller.new

router = Router.new(controller)

# Start the app
router.run


