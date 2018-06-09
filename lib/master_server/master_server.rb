require "socket"

module RenegadeFriends
  # I'll just leave this here: ./gslist -n cncrenegade -x renmaster.cncnet.org:28900 -t 0
  class MasterServer
    def initialize(host = "renmaster.cncnet.org", port = 28900)
      @host, port = host, port
      @socket = TCPSocket.new(host, port)
      query
    end

    def query
      line_string = ""
      until line_string.include?("final")
        while line = @socket.gets
          p line
          line_string << line
        end
      end

      @socket.write "\\gamename\\gamespy2\\gamever\\20603020\\enctype\\0\\validate\\8M7BK3Lw\\final\\list\\cmp\\gamename\\cncrenegade"

      line_string = ""
      until line_string.include?("final")
        while line = @socket.gets
          p line
          line_string << line
        end
      end
      @socket.close
    end
  end
end