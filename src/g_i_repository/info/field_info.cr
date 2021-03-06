require "./base_info"

module GIRepository
  class FieldInfo < BaseInfo
    KEYWORDS = {"end", "next"}

    def type
      TypeInfo.new LibGIRepository.field_info_get_type(self)
    end

    def name(keyword_safe=true)
      name = super()
      name += '_' if keyword_safe && KEYWORDS.includes? name
      name
    end

    def flags
      LibGIRepository.field_info_get_flags(self)
    end

    def readable?
      flags.readable?
    end

    def writable?
      flags.writable?
    end

    def lib_definition
      "  #{name} : #{type.lib_definition}"
    end
  end
end
