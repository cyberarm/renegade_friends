module RenegadeFriends
  class HeaderContainer < CyberarmEngine::Container
    def setup
      set_layout_y(10, 20)
      text "Renegade Friends", 10, 10, 36, Gosu::Color::WHITE, :center
      text "Bringing players together or something.", 10, 50, 18, Gosu::Color::WHITE, :center

      button("Home", 10, 60) do
        $window.active_container = HomeContainer.new(0, 100, $window.width, $window.height)
      end

      button("About", 80, 60) do
        $window.active_container = AboutContainer.new(0, 100, $window.width, $window.height)
      end
      button("Servers", 150, 60)
      button("Buddies/Friends", 220, 60)
    end

    def draw
      super
      fill(Gosu::Color.rgb(100,50,25), -1)
    end
  end
end