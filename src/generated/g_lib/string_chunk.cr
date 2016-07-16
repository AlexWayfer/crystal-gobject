module GLib
  class StringChunk
    include GObject::WrappedType

    def self.new : self
      ptr = Pointer(UInt8).malloc(0, 0)
      super(ptr.as(LibGLib::StringChunk*))
    end

    @g_lib_string_chunk : LibGLib::StringChunk*?
    def initialize(@g_lib_string_chunk : LibGLib::StringChunk*)
    end

    def to_unsafe
      @g_lib_string_chunk.not_nil!.as(Void*)
    end

    def clear
      __return_value = LibGLib.string_chunk_clear(to_unsafe.as(LibGLib::StringChunk*))
      __return_value
    end

    def free
      __return_value = LibGLib.string_chunk_free(to_unsafe.as(LibGLib::StringChunk*))
      __return_value
    end

    def insert(string)
      __return_value = LibGLib.string_chunk_insert(to_unsafe.as(LibGLib::StringChunk*), string.to_unsafe)
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def insert_const(string)
      __return_value = LibGLib.string_chunk_insert_const(to_unsafe.as(LibGLib::StringChunk*), string.to_unsafe)
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def insert_len(string, len)
      __return_value = LibGLib.string_chunk_insert_len(to_unsafe.as(LibGLib::StringChunk*), string.to_unsafe, Int64.new(len))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

  end
end

