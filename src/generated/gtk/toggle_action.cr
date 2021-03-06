require "./action"

module Gtk
  class ToggleAction < Action
    @gtk_toggle_action : LibGtk::ToggleAction*?
    def initialize(@gtk_toggle_action : LibGtk::ToggleAction*)
    end

    def to_unsafe
      @gtk_toggle_action.not_nil!.as(Void*)
    end

    # Implements Buildable


    def self.new(name, label, tooltip, stock_id) : self
      __return_value = LibGtk.toggle_action_new(name.to_unsafe, label && label.to_unsafe, tooltip && tooltip.to_unsafe, stock_id && stock_id.to_unsafe)
      cast Gtk::ToggleAction.new(__return_value)
    end

    def active
      __return_value = LibGtk.toggle_action_get_active(to_unsafe.as(LibGtk::ToggleAction*))
      __return_value
    end

    def draw_as_radio
      __return_value = LibGtk.toggle_action_get_draw_as_radio(to_unsafe.as(LibGtk::ToggleAction*))
      __return_value
    end

    def active=(is_active)
      __return_value = LibGtk.toggle_action_set_active(to_unsafe.as(LibGtk::ToggleAction*), is_active)
      __return_value
    end

    def draw_as_radio=(draw_as_radio)
      __return_value = LibGtk.toggle_action_set_draw_as_radio(to_unsafe.as(LibGtk::ToggleAction*), draw_as_radio)
      __return_value
    end

    def toggled
      __return_value = LibGtk.toggle_action_toggled(to_unsafe.as(LibGtk::ToggleAction*))
      __return_value
    end

    alias ToggledSignal = ToggleAction ->
    def on_toggled(&__block : ToggledSignal)
      __callback = ->(_arg0 : LibGtk::ToggleAction*) {
       __return_value = __block.call(ToggleAction.new(_arg0))
       __return_value
      }
      connect("toggled", __callback)
    end

  end
end

