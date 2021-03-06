require "./socket_connection"

module Gio
  class TcpConnection < SocketConnection
    @gio_tcp_connection : LibGio::TcpConnection*?
    def initialize(@gio_tcp_connection : LibGio::TcpConnection*)
    end

    def to_unsafe
      @gio_tcp_connection.not_nil!.as(Void*)
    end


    def graceful_disconnect
      __return_value = LibGio.tcp_connection_get_graceful_disconnect(to_unsafe.as(LibGio::TcpConnection*))
      __return_value
    end

    def graceful_disconnect=(graceful_disconnect)
      __return_value = LibGio.tcp_connection_set_graceful_disconnect(to_unsafe.as(LibGio::TcpConnection*), graceful_disconnect)
      __return_value
    end

  end
end

