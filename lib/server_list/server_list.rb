module RenegadeFriends
  module ServerList
    Server = Struct.new(:name, :current_map, :players, :max_players, :locked)
    def server_list(y, servers = [Server.new("MPF", "CNC", 24, 64, false), Server.new("MPF", "CNC", 24, 64, false)])
      @server_list_servers = servers
      @server_list_initial_y= y
      set_layout_y(y, 24)
      @server_list_servers.each do |server|
        text "#{server.name}", 10, layout_y(true), 24
      end
    end

    def draw_server_list
      @server_list_servers.each_with_index do |server, i|
        if i.even?
          Gosu.draw_rect(0, relative_y(@server_list_initial_y+(24*i)), self.width, 20, Gosu::Color::BLUE)
        else
          Gosu.draw_rect(0, relative_y(@server_list_initial_y+(24*i)), self.width, 20, Gosu::Color::GREEN)
        end
      end
    end
  end
end