begin
  require "cyberarm_engine"
rescue LoadError
  require_relative "../cyberarm_engine/lib/cyberarm_engine"
end

require_relative "lib/states/main_menu"

require_relative "lib/master_server/master_server"
require_relative "lib/server_list/server_list"

# require_relative "lib/containers/header"
# require_relative "lib/containers/home"
# require_relative "lib/containers/about"
# require_relative "lib/containers/friends"



module RenegadeFriends
  LAUNCH_TIME = Time.now
  VALID_EXECUTABLES = ["game.exe", "game2.exe"]
  class Window < CyberarmEngine::Engine
    def initialize
      super(width: 640, height: 480, fullscreen: false, resizable: true)
    end
    def setup
      push_state(MainMenu)
    end
  end
end

RenegadeFriends::Window.new.show