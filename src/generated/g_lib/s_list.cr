module GLib
  class SList
    include GObject::WrappedType

    def self.new(data : Void*|Nil = nil, next next_ : Void*|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(16, 0u8)
      new(ptr.as(LibGLib::SList*)).tap do |object|
        object.data = data unless data.nil?
        object.next = next_ unless next_.nil?
      end
    end

    @g_lib_s_list : LibGLib::SList*?
    def initialize(@g_lib_s_list : LibGLib::SList*)
    end

    def to_unsafe
      @g_lib_s_list.not_nil!.as(Void*)
    end

    def data
      (to_unsafe.as(LibGLib::SList*).value.data)
    end

    def data=(value : Void*)
      to_unsafe.as(LibGLib::SList*).value.data = value
    end

    def next
      GLib::SListIterator(Void*, Void**).new(GLib::SList.new((to_unsafe.as(LibGLib::SList*).value.next_).as(LibGLib::SList*)))
    end

    def next=(value : Void*)
      to_unsafe.as(LibGLib::SList*).value.next_ = value
    end

  end
end

