module Gtk
  class ToolbarPrivate
    include GObject::WrappedType

    @gtk_toolbar_private : LibGtk::ToolbarPrivate*?
    def initialize(@gtk_toolbar_private : LibGtk::ToolbarPrivate*)
    end

    def to_unsafe
      @gtk_toolbar_private.not_nil!.as(Void*)
    end

  end
end

