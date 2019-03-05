module RenegadeFriends
  require "open-uri"
  require "json"
  class MainMenu < CyberarmEngine::GuiState
    def setup
      @cwidth, @cheight = window.width, window.height
      @data = JSON.parse(open("http://192.168.1.111:3000/api/game-servers").read)

      self.show_cursor = true
      background Gosu::Color.rgb(45, 29, 19)

      @header = flow width: window.width, padding_top: 20, padding_bottom: 20 do
        background [
          Gosu::Color::BLACK, Gosu::Color::BLACK,
          Gosu::Color.rgb(45, 29, 19), Gosu::Color.rgb(45, 29, 19)
        ]

        label "Renegade Friends", text_size: 40, color: Gosu::Color.rgb(255,127,0)
        button "Home", margin_left: 10 do
        end
        button "Friends", margin_left: 10 do
        end
        button "Exit", margin_left: 10 do
          window.close
        end
      end

      @content = flow width: window.width, height: window.height, margin_left: 15 do
        @data.reject {|s| !s["name"].include?("C&C")}.each do |server|
          stack do
            background Gosu::Color.rgb(rand(100), rand(100), rand(100))
            flow do
              label server["name"], margin_top: 8, text_shadow: true
              button "Join", margin_left: 10
            end
            label "Map #{server["mapname"]} ✅"
            label "Time left #{server["timeleft"]}"
            label "Players #{server["numplayers"]}/#{server["maxplayers"]}"
            label ""

            server["players"].each do |player|
              player["ping"] ||= 0
              label "#{player["team"].downcase.include?("nod") ? "<c=ffff0000>#{player["player"]}</c>" : "<c=ffFFA500>#{player["player"]}</c>"} on #{player["team"]} score #{player["score"]} K/D #{(player["kills"].to_f/player["deaths"].to_f).round(2)}. (#{player["ping"]}ms)"
            end
          end
        end
      end
    end

    def update
      super

      if @cwidth != window.width || @cheight != window.height
        @cwidth,@cheight = window.width, window.height

        @header.width = window.width
        @content.width  = window.width
        @content.height = window.height

        @root_container.recalculate
      end
    end
  end
end