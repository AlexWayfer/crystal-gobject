require "./plugin_feature"

module Gst
  class DeviceProviderFactory < PluginFeature
    @gst_device_provider_factory : LibGst::DeviceProviderFactory*?
    def initialize(@gst_device_provider_factory : LibGst::DeviceProviderFactory*)
    end

    def to_unsafe
      @gst_device_provider_factory.not_nil!.as(Void*)
    end

    def self.find(name)
      __return_value = LibGst.device_provider_factory_find(name.to_unsafe)
      Gst::DeviceProviderFactory.new(__return_value) if __return_value
    end

    def self.by_name(factoryname)
      __return_value = LibGst.device_provider_factory_get_by_name(factoryname.to_unsafe)
      Gst::DeviceProvider.new(__return_value) if __return_value
    end

    def self.list_get_device_providers(minrank : Gst::Rank)
      __return_value = LibGst.device_provider_factory_list_get_device_providers(minrank)
      GLib::ListIterator(Gst::DeviceProviderFactory, LibGst::DeviceProviderFactory*).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def get
      __return_value = LibGst.device_provider_factory_get(to_unsafe.as(LibGst::DeviceProviderFactory*))
      Gst::DeviceProvider.new(__return_value) if __return_value
    end

    def device_provider_type
      __return_value = LibGst.device_provider_factory_get_device_provider_type(to_unsafe.as(LibGst::DeviceProviderFactory*))
      __return_value
    end

    def metadata(key)
      __return_value = LibGst.device_provider_factory_get_metadata(to_unsafe.as(LibGst::DeviceProviderFactory*), key.to_unsafe)
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value)) if __return_value
    end

    def metadata_keys
      __return_value = LibGst.device_provider_factory_get_metadata_keys(to_unsafe.as(LibGst::DeviceProviderFactory*))
      PointerIterator.new(__return_value) {|__item| (raise "Expected string but got null" unless __item; ::String.new(__item)) } if __return_value
    end

    def has_classes(classes)
      __return_value = LibGst.device_provider_factory_has_classes(to_unsafe.as(LibGst::DeviceProviderFactory*), classes && classes.to_unsafe)
      __return_value
    end

    def has_classesv(classes)
      __return_value = LibGst.device_provider_factory_has_classesv(to_unsafe.as(LibGst::DeviceProviderFactory*), classes && classes)
      __return_value
    end

  end
end

