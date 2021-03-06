require "./tool_button"

module Gtk
  class ToggleToolButton < ToolButton
    @gtk_toggle_tool_button : LibGtk::ToggleToolButton*?
    def initialize(@gtk_toggle_tool_button : LibGtk::ToggleToolButton*)
    end

    def to_unsafe
      @gtk_toggle_tool_button.not_nil!.as(Void*)
    end

    # Implements ImplementorIface
    # Implements Actionable
    # Implements Activatable
    # Implements Buildable

    def self.new : self
      __return_value = LibGtk.toggle_tool_button_new
      cast Gtk::ToolItem.new(__return_value)
    end

    def self.new_from_stock(stock_id) : self
      __return_value = LibGtk.toggle_tool_button_new_from_stock(stock_id.to_unsafe)
      cast Gtk::ToolItem.new(__return_value)
    end

    def active
      __return_value = LibGtk.toggle_tool_button_get_active(to_unsafe.as(LibGtk::ToggleToolButton*))
      __return_value
    end

    def active=(is_active)
      __return_value = LibGtk.toggle_tool_button_set_active(to_unsafe.as(LibGtk::ToggleToolButton*), is_active)
      __return_value
    end

    alias ToggledSignal = ToggleToolButton ->
    def on_toggled(&__block : ToggledSignal)
      __callback = ->(_arg0 : LibGtk::ToggleToolButton*) {
       __return_value = __block.call(ToggleToolButton.new(_arg0))
       __return_value
      }
      connect("toggled", __callback)
    end

  end
end

