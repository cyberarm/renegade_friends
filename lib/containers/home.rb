module RenegadeFriends
  class HomeContainer < CyberarmEngine::Container
    def setup
      set_layout_y(10, 20)
      text "Home", 10, layout_y, 24
      layout_y
      layout_y
      text "Log In", 10, layout_y, 18
      text "Username", 10, layout_y, 18
      input "", 10, layout_y
      layout_y
      layout_y
      text "Password", 10, layout_y, 18
      input "", 10, layout_y
      layout_y
      layout_y
      button "Log In", 10, layout_y
    end

    def draw
      super
      fill(Gosu::Color.rgb(100,50,25), -1)
    end
  end
end