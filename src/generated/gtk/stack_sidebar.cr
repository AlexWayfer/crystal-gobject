require "./bin"

module Gtk
  class StackSidebar < Bin
    @gtk_stack_sidebar : LibGtk::StackSidebar*?
    def initialize(@gtk_stack_sidebar : LibGtk::StackSidebar*)
    end

    def to_unsafe
      @gtk_stack_sidebar.not_nil!.as(Void*)
    end

    # Implements ImplementorIface
    # Implements Buildable

    def self.new : self
      __return_value = LibGtk.stack_sidebar_new
      cast Gtk::Widget.new(__return_value)
    end

    def stack
      __return_value = LibGtk.stack_sidebar_get_stack(to_unsafe.as(LibGtk::StackSidebar*))
      Gtk::Stack.new(__return_value) if __return_value
    end

    def stack=(stack)
      __return_value = LibGtk.stack_sidebar_set_stack(to_unsafe.as(LibGtk::StackSidebar*), stack.to_unsafe.as(LibGtk::Stack*))
      __return_value
    end

  end
end

