module GModule
  def self.module_build_path(directory, module_name)
    __return_value = LibGModule.module_build_path(directory && directory.to_unsafe, module_name.to_unsafe)
    (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
  end

  def self.module_error
    __return_value = LibGModule.module_error
    (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
  end

  def self.module_supported
    __return_value = LibGModule.module_supported
    __return_value
  end
end

