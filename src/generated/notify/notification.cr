module Notify
  class Notification < GObject::Object
    @notify_notification : LibNotify::Notification*?
    def initialize(@notify_notification : LibNotify::Notification*)
    end

    def to_unsafe
      @notify_notification.not_nil!.as(Void*)
    end







    def self.new(summary, body, icon) : self
      __return_value = LibNotify.notification_new(summary.to_unsafe, body && body.to_unsafe, icon && icon.to_unsafe)
      cast Notify::Notification.new(__return_value)
    end

    def add_action(action, label, callback, user_data, free_func)
      __return_value = LibNotify.notification_add_action(to_unsafe.as(LibNotify::Notification*), action.to_unsafe, label.to_unsafe, callback, user_data, free_func)
      __return_value
    end

    def clear_actions
      __return_value = LibNotify.notification_clear_actions(to_unsafe.as(LibNotify::Notification*))
      __return_value
    end

    def clear_hints
      __return_value = LibNotify.notification_clear_hints(to_unsafe.as(LibNotify::Notification*))
      __return_value
    end

    def close
      __error = Pointer(LibGLib::Error).null
      __return_value = LibNotify.notification_close(to_unsafe.as(LibNotify::Notification*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def closed_reason
      __return_value = LibNotify.notification_get_closed_reason(to_unsafe.as(LibNotify::Notification*))
      __return_value
    end

    def app_name=(app_name)
      __return_value = LibNotify.notification_set_app_name(to_unsafe.as(LibNotify::Notification*), app_name.to_unsafe)
      __return_value
    end

    def category=(category)
      __return_value = LibNotify.notification_set_category(to_unsafe.as(LibNotify::Notification*), category.to_unsafe)
      __return_value
    end

    def set_hint(key, value)
      __return_value = LibNotify.notification_set_hint(to_unsafe.as(LibNotify::Notification*), key.to_unsafe, value && value.to_unsafe.as(LibGLib::Variant*))
      __return_value
    end

    def set_hint_byte(key, value)
      __return_value = LibNotify.notification_set_hint_byte(to_unsafe.as(LibNotify::Notification*), key.to_unsafe, UInt8.new(value))
      __return_value
    end

    def set_hint_byte_array(key, value, len)
      __return_value = LibNotify.notification_set_hint_byte_array(to_unsafe.as(LibNotify::Notification*), key.to_unsafe, value, UInt64.new(len))
      __return_value
    end

    def set_hint_double(key, value)
      __return_value = LibNotify.notification_set_hint_double(to_unsafe.as(LibNotify::Notification*), key.to_unsafe, Float64.new(value))
      __return_value
    end

    def set_hint_int32(key, value)
      __return_value = LibNotify.notification_set_hint_int32(to_unsafe.as(LibNotify::Notification*), key.to_unsafe, Int32.new(value))
      __return_value
    end

    def set_hint_string(key, value)
      __return_value = LibNotify.notification_set_hint_string(to_unsafe.as(LibNotify::Notification*), key.to_unsafe, value.to_unsafe)
      __return_value
    end

    def set_hint_uint32(key, value)
      __return_value = LibNotify.notification_set_hint_uint32(to_unsafe.as(LibNotify::Notification*), key.to_unsafe, UInt32.new(value))
      __return_value
    end

    def icon_from_pixbuf=(icon)
      __return_value = LibNotify.notification_set_icon_from_pixbuf(to_unsafe.as(LibNotify::Notification*), icon.to_unsafe.as(LibGdkPixbuf::Pixbuf*))
      __return_value
    end

    def image_from_pixbuf=(pixbuf)
      __return_value = LibNotify.notification_set_image_from_pixbuf(to_unsafe.as(LibNotify::Notification*), pixbuf.to_unsafe.as(LibGdkPixbuf::Pixbuf*))
      __return_value
    end

    def timeout=(timeout)
      __return_value = LibNotify.notification_set_timeout(to_unsafe.as(LibNotify::Notification*), Int32.new(timeout))
      __return_value
    end

    def urgency=(urgency : Notify::Urgency)
      __return_value = LibNotify.notification_set_urgency(to_unsafe.as(LibNotify::Notification*), urgency)
      __return_value
    end

    def show
      __error = Pointer(LibGLib::Error).null
      __return_value = LibNotify.notification_show(to_unsafe.as(LibNotify::Notification*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def update(summary, body, icon)
      __return_value = LibNotify.notification_update(to_unsafe.as(LibNotify::Notification*), summary.to_unsafe, body && body.to_unsafe, icon && icon.to_unsafe)
      __return_value
    end

    alias ClosedSignal = Notification ->
    def on_closed(&__block : ClosedSignal)
      __callback = ->(_arg0 : LibNotify::Notification*) {
       __return_value = __block.call(Notification.new(_arg0))
       __return_value
      }
      connect("closed", __callback)
    end

  end
end

