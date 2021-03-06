require "./pixbuf_animation"

module GdkPixbuf
  class PixbufSimpleAnim < PixbufAnimation
    @gdk_pixbuf_pixbuf_simple_anim : LibGdkPixbuf::PixbufSimpleAnim*?
    def initialize(@gdk_pixbuf_pixbuf_simple_anim : LibGdkPixbuf::PixbufSimpleAnim*)
    end

    def to_unsafe
      @gdk_pixbuf_pixbuf_simple_anim.not_nil!.as(Void*)
    end


    def self.new(width, height, rate) : self
      __return_value = LibGdkPixbuf.pixbuf_simple_anim_new(Int32.new(width), Int32.new(height), Float32.new(rate))
      cast GdkPixbuf::PixbufSimpleAnim.new(__return_value)
    end

    def add_frame(pixbuf)
      __return_value = LibGdkPixbuf.pixbuf_simple_anim_add_frame(to_unsafe.as(LibGdkPixbuf::PixbufSimpleAnim*), pixbuf.to_unsafe.as(LibGdkPixbuf::Pixbuf*))
      __return_value
    end

    def loop
      __return_value = LibGdkPixbuf.pixbuf_simple_anim_get_loop(to_unsafe.as(LibGdkPixbuf::PixbufSimpleAnim*))
      __return_value
    end

    def loop=(loop)
      __return_value = LibGdkPixbuf.pixbuf_simple_anim_set_loop(to_unsafe.as(LibGdkPixbuf::PixbufSimpleAnim*), loop)
      __return_value
    end

  end
end

