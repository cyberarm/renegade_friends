module RenegadeFriends
  class HomeContainer < CyberarmEngine::Container
    include RenegadeFriends::ServerList

    def setup
      set_layout_y(10, 20)
      text "Home", 10, layout_y, 24
      layout_y
      text "GameSpy in-game name", 10, layout_y, 22
      input "", 10, layout_y
      layout_y
      check_box 10, layout_y
      text "Remember me", 50, layout_y, 20
      layout_y
      button "Continue", 10, layout_y
      layout_y
      button "Refresh", 10, layout_y do
        MasterServer.new
      end

      server_list(layout_y+50)
    end

    def draw
      super
      fill(Gosu::Color.rgb(100,50,25), -1)
      draw_server_list
    end
  end
end