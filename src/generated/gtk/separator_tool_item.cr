require "./tool_item"

module Gtk
  class SeparatorToolItem < ToolItem
    @gtk_separator_tool_item : LibGtk::SeparatorToolItem*?
    def initialize(@gtk_separator_tool_item : LibGtk::SeparatorToolItem*)
    end

    def to_unsafe
      @gtk_separator_tool_item.not_nil!.as(Void*)
    end

    # Implements ImplementorIface
    # Implements Activatable
    # Implements Buildable

    def self.new : self
      __return_value = LibGtk.separator_tool_item_new
      cast Gtk::ToolItem.new(__return_value)
    end

    def draw
      __return_value = LibGtk.separator_tool_item_get_draw(to_unsafe.as(LibGtk::SeparatorToolItem*))
      __return_value
    end

    def draw=(draw)
      __return_value = LibGtk.separator_tool_item_set_draw(to_unsafe.as(LibGtk::SeparatorToolItem*), draw)
      __return_value
    end

  end
end

