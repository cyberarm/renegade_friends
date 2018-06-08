module RenegadeFriends
  class AboutContainer < CyberarmEngine::Container
    def setup
      set_layout_y(10, 20)
      text "About", 10, layout_y, 24
      Gosu::LICENSES.split("\n").each_with_index do |software, i|
        if i > 1
          software = software.split(",")
          t = text "#{software[0]}", 10, layout_y(true)+10, 20
          b = button("Website", 10+t.x+t.width, layout_y(true), "#{software[1]}") do
            system("start #{software[1]}")
          end
          button("#{software[2].strip}", 10+b.x+b.width, layout_y, "#{software[3].strip}") do
            system("start #{software[3].strip}")
          end
          layout_y
          layout_y
        else
          text "#{software}", 10, layout_y
        end
      end
    end

    def draw
      super
      fill(Gosu::Color.rgb(100,50,25), -1)
    end
  end
end