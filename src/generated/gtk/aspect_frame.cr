require "./frame"

module Gtk
  class AspectFrame < Frame
    @gtk_aspect_frame : LibGtk::AspectFrame*?
    def initialize(@gtk_aspect_frame : LibGtk::AspectFrame*)
    end

    def to_unsafe
      @gtk_aspect_frame.not_nil!.as(Void*)
    end

    # Implements ImplementorIface
    # Implements Buildable




    def self.new(label, xalign, yalign, ratio, obey_child) : self
      __return_value = LibGtk.aspect_frame_new(label && label.to_unsafe, Float32.new(xalign), Float32.new(yalign), Float32.new(ratio), obey_child)
      cast Gtk::Widget.new(__return_value)
    end

    def set(xalign, yalign, ratio, obey_child)
      __return_value = LibGtk.aspect_frame_set(to_unsafe.as(LibGtk::AspectFrame*), Float32.new(xalign), Float32.new(yalign), Float32.new(ratio), obey_child)
      __return_value
    end

  end
end

