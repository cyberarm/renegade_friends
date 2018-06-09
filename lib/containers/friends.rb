module RenegadeFriends
  class FriendsContainer < CyberarmEngine::Container
    def setup
      set_layout_y(10, 20)
      text "Friends", 10, layout_y, 24
      layout_y
    end

    def draw
      super
      fill(Gosu::Color.rgb(100,50,25), -1)
    end
  end
end