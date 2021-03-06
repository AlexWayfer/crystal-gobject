require "./container_accessible"

module Gtk
  class MenuItemAccessible < ContainerAccessible
    @gtk_menu_item_accessible : LibGtk::MenuItemAccessible*?
    def initialize(@gtk_menu_item_accessible : LibGtk::MenuItemAccessible*)
    end

    def to_unsafe
      @gtk_menu_item_accessible.not_nil!.as(Void*)
    end

    # Implements Action
    # Implements Component
    # Implements Selection
  end
end

