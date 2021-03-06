module Atk
  class Implementor
    include GObject::WrappedType

    @atk_implementor : LibAtk::Implementor*?
    def initialize(@atk_implementor : LibAtk::Implementor*)
    end

    def to_unsafe
      @atk_implementor.not_nil!.as(Void*)
    end

    def ref_accessible
      __return_value = LibAtk.implementor_ref_accessible(to_unsafe.as(LibAtk::Implementor*))
      Atk::Object.new(__return_value)
    end

  end
end

