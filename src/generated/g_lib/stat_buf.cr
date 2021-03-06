module GLib
  class StatBuf
    include GObject::WrappedType

    @g_lib_stat_buf : LibGLib::StatBuf*?
    def initialize(@g_lib_stat_buf : LibGLib::StatBuf*)
    end

    def to_unsafe
      @g_lib_stat_buf.not_nil!.as(Void*)
    end

  end
end

