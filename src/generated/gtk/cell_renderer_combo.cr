require "./cell_renderer_text"

module Gtk
  class CellRendererCombo < CellRendererText
    @gtk_cell_renderer_combo : LibGtk::CellRendererCombo*?
    def initialize(@gtk_cell_renderer_combo : LibGtk::CellRendererCombo*)
    end

    def to_unsafe
      @gtk_cell_renderer_combo.not_nil!.as(Void*)
    end




    def self.new : self
      __return_value = LibGtk.cell_renderer_combo_new
      cast Gtk::CellRenderer.new(__return_value)
    end

    alias ChangedSignal = CellRendererCombo, String, Gtk::TreeIter ->
    def on_changed(&__block : ChangedSignal)
      __callback = ->(_arg0 : LibGtk::CellRendererCombo*, _arg1 : LibGtk::UInt8**, _arg2 : LibGtk::LibGtk::TreeIter*) {
       __return_value = __block.call(CellRendererCombo.new(_arg0), (raise "Expected string but got null" unless _arg1; ::String.new(_arg1)), Gtk::TreeIter.new(_arg2))
       __return_value
      }
      connect("changed", __callback)
    end

  end
end

