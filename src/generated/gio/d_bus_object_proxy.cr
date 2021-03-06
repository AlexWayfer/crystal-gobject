module Gio
  class DBusObjectProxy < GObject::Object
    @gio_d_bus_object_proxy : LibGio::DBusObjectProxy*?
    def initialize(@gio_d_bus_object_proxy : LibGio::DBusObjectProxy*)
    end

    def to_unsafe
      @gio_d_bus_object_proxy.not_nil!.as(Void*)
    end

    # Implements DBusObject


    def self.new(connection, object_path) : self
      __return_value = LibGio.d_bus_object_proxy_new(connection.to_unsafe.as(LibGio::DBusConnection*), object_path.to_unsafe)
      cast Gio::DBusObjectProxy.new(__return_value)
    end

    def connection
      __return_value = LibGio.d_bus_object_proxy_get_connection(to_unsafe.as(LibGio::DBusObjectProxy*))
      Gio::DBusConnection.new(__return_value)
    end

  end
end

