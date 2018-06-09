begin
  require "cyberarm_engine"
rescue LoadError
  require_relative "../cyberarm_engine/lib/cyberarm_engine"
end

require_relative "lib/master_server/master_server"
require_relative "lib/server_list/server_list"

require_relative "lib/containers/header"
require_relative "lib/containers/home"
require_relative "lib/containers/about"
require_relative "lib/containers/friends"



module RenegadeFriends
  LAUNCH_TIME = Time.now
  VALID_EXECUTABLES = ["game.exe", "game2.exe"]
  class Window < CyberarmEngine::Engine
    attr_accessor :active_container
    def setup
      self.show_cursor = true
      @navigation_container = HeaderContainer.new(0, 0, self.width, 100)
      @active_container = HomeContainer.new(0, 100, self.width, self.height)
    end

    def draw
      draw_rect(0, 0, self.width, 100, Gosu::Color.rgba(45,61,12, 200))
      @navigation_container.draw
      @active_container.draw
    end

    def update
      super
      unless @loaded
        puts "Took: #{Time.now-LAUNCH_TIME} to open window."
        @loaded = true
      end
      self.caption = "Renegade Friends - #{@active_container.class.to_s.sub('RenegadeFriends::', '').sub('Container', '')}"
      @navigation_container.update
      @active_container.update
    end

    def button_up(id)
      @navigation_container.button_up(id)
      @active_container.button_up(id)
    end

    def drop(filename)
      puts filename
    end
  end
end

RenegadeFriends::Window.new.show