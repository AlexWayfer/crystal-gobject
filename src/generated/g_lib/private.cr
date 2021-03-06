module GLib
  class Private
    include GObject::WrappedType

    def self.new : self
      ptr = Pointer(UInt8).malloc(32, 0u8)
      super(ptr.as(LibGLib::Private*))
    end

    @g_lib_private : LibGLib::Private*?
    def initialize(@g_lib_private : LibGLib::Private*)
    end

    def to_unsafe
      @g_lib_private.not_nil!.as(Void*)
    end

    def get
      __return_value = LibGLib.private_get(to_unsafe.as(LibGLib::Private*))
      __return_value if __return_value
    end

    def replace(value)
      __return_value = LibGLib.private_replace(to_unsafe.as(LibGLib::Private*), value && value)
      __return_value
    end

    def set(value)
      __return_value = LibGLib.private_set(to_unsafe.as(LibGLib::Private*), value && value)
      __return_value
    end

    def p
      (to_unsafe.as(LibGLib::Private*).value.p)
    end

    def notify
      (to_unsafe.as(LibGLib::Private*).value.notify)
    end

    def future
      PointerIterator.new((to_unsafe.as(LibGLib::Private*).value.future)) {|__item| __item }
    end

  end
end

