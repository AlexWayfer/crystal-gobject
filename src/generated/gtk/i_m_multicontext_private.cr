module Gtk
  class IMMulticontextPrivate
    include GObject::WrappedType

    def self.new : self
      ptr = Pointer(UInt8).malloc(0, 0)
      super(ptr.as(LibGtk::IMMulticontextPrivate*))
    end

    @gtk_i_m_multicontext_private : LibGtk::IMMulticontextPrivate*?
    def initialize(@gtk_i_m_multicontext_private : LibGtk::IMMulticontextPrivate*)
    end

    def to_unsafe
      @gtk_i_m_multicontext_private.not_nil!.as(Void*)
    end

  end
end

