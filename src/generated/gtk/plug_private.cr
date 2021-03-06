module Gtk
  class PlugPrivate
    include GObject::WrappedType

    @gtk_plug_private : LibGtk::PlugPrivate*?
    def initialize(@gtk_plug_private : LibGtk::PlugPrivate*)
    end

    def to_unsafe
      @gtk_plug_private.not_nil!.as(Void*)
    end

  end
end

