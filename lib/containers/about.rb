module RenegadeFriends
  class AboutContainer < CyberarmEngine::Container
    def setup
      set_layout_y(10, 20)
      text "About", 10, layout_y, 24
      text "Software Used", 10, layout_y
      Gosu::LICENSES.split("\n").each do |software|
        text "#{software}", 10, layout_y
      end
    end

    def draw
      super
      fill(Gosu::Color.rgb(100,50,25), -1)
    end
  end
end