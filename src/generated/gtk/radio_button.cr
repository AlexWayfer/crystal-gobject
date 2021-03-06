require "./check_button"

module Gtk
  class RadioButton < CheckButton
    @gtk_radio_button : LibGtk::RadioButton*?
    def initialize(@gtk_radio_button : LibGtk::RadioButton*)
    end

    def to_unsafe
      @gtk_radio_button.not_nil!.as(Void*)
    end

    # Implements ImplementorIface
    # Implements Actionable
    # Implements Activatable
    # Implements Buildable

    def self.new(group) : self
      __return_value = LibGtk.radio_button_new(group && group)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_from_widget(radio_group_member) : self
      __return_value = LibGtk.radio_button_new_from_widget(radio_group_member && radio_group_member.to_unsafe.as(LibGtk::RadioButton*))
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_label(group, label) : self
      __return_value = LibGtk.radio_button_new_with_label(group && group, label.to_unsafe)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_label_from_widget(radio_group_member, label) : self
      __return_value = LibGtk.radio_button_new_with_label_from_widget(radio_group_member && radio_group_member.to_unsafe.as(LibGtk::RadioButton*), label.to_unsafe)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_mnemonic(group, label) : self
      __return_value = LibGtk.radio_button_new_with_mnemonic(group && group, label.to_unsafe)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_mnemonic_from_widget(radio_group_member, label) : self
      __return_value = LibGtk.radio_button_new_with_mnemonic_from_widget(radio_group_member && radio_group_member.to_unsafe.as(LibGtk::RadioButton*), label.to_unsafe)
      cast Gtk::Widget.new(__return_value)
    end

    def group
      __return_value = LibGtk.radio_button_get_group(to_unsafe.as(LibGtk::RadioButton*))
      GLib::SListIterator(Gtk::RadioButton, LibGtk::RadioButton*).new(GLib::SList.new(__return_value.as(LibGLib::SList*)))
    end

    def join_group(group_source)
      __return_value = LibGtk.radio_button_join_group(to_unsafe.as(LibGtk::RadioButton*), group_source && group_source.to_unsafe.as(LibGtk::RadioButton*))
      __return_value
    end

    def group=(group)
      __return_value = LibGtk.radio_button_set_group(to_unsafe.as(LibGtk::RadioButton*), group && group)
      __return_value
    end

    alias GroupChangedSignal = RadioButton ->
    def on_group_changed(&__block : GroupChangedSignal)
      __callback = ->(_arg0 : LibGtk::RadioButton*) {
       __return_value = __block.call(RadioButton.new(_arg0))
       __return_value
      }
      connect("group-changed", __callback)
    end

  end
end

