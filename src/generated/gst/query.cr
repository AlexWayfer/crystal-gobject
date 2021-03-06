module Gst
  class Query
    include GObject::WrappedType

    def self.new(mini_object : Gst::MiniObject|Nil = nil, type : Gst::QueryType|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(72, 0u8)
      new(ptr.as(LibGst::Query*)).tap do |object|
        object.mini_object = mini_object unless mini_object.nil?
        object.type = type unless type.nil?
      end
    end

    @gst_query : LibGst::Query*?
    def initialize(@gst_query : LibGst::Query*)
    end

    def to_unsafe
      @gst_query.not_nil!.as(Void*)
    end

    def self.new_accept_caps(caps) : self
      __return_value = LibGst.query_new_accept_caps(caps.to_unsafe.as(LibGst::Caps*))
      cast Gst::Query.new(__return_value)
    end

    def self.new_allocation(caps, need_pool) : self
      __return_value = LibGst.query_new_allocation(caps.to_unsafe.as(LibGst::Caps*), need_pool)
      cast Gst::Query.new(__return_value)
    end

    def self.new_buffering(format : Gst::Format) : self
      __return_value = LibGst.query_new_buffering(format)
      cast Gst::Query.new(__return_value)
    end

    def self.new_caps(filter) : self
      __return_value = LibGst.query_new_caps(filter.to_unsafe.as(LibGst::Caps*))
      cast Gst::Query.new(__return_value)
    end

    def self.new_context(context_type) : self
      __return_value = LibGst.query_new_context(context_type.to_unsafe)
      cast Gst::Query.new(__return_value)
    end

    def self.new_convert(src_format : Gst::Format, value, dest_format : Gst::Format) : self
      __return_value = LibGst.query_new_convert(src_format, Int64.new(value), dest_format)
      cast Gst::Query.new(__return_value)
    end

    def self.new_custom(type : Gst::QueryType, structure) : self
      __return_value = LibGst.query_new_custom(type, structure && structure.to_unsafe.as(LibGst::Structure*))
      cast Gst::Query.new(__return_value)
    end

    def self.new_drain : self
      __return_value = LibGst.query_new_drain
      cast Gst::Query.new(__return_value)
    end

    def self.new_duration(format : Gst::Format) : self
      __return_value = LibGst.query_new_duration(format)
      cast Gst::Query.new(__return_value)
    end

    def self.new_formats : self
      __return_value = LibGst.query_new_formats
      cast Gst::Query.new(__return_value)
    end

    def self.new_latency : self
      __return_value = LibGst.query_new_latency
      cast Gst::Query.new(__return_value)
    end

    def self.new_position(format : Gst::Format) : self
      __return_value = LibGst.query_new_position(format)
      cast Gst::Query.new(__return_value)
    end

    def self.new_scheduling : self
      __return_value = LibGst.query_new_scheduling
      cast Gst::Query.new(__return_value)
    end

    def self.new_seeking(format : Gst::Format) : self
      __return_value = LibGst.query_new_seeking(format)
      cast Gst::Query.new(__return_value)
    end

    def self.new_segment(format : Gst::Format) : self
      __return_value = LibGst.query_new_segment(format)
      cast Gst::Query.new(__return_value)
    end

    def self.new_uri : self
      __return_value = LibGst.query_new_uri
      cast Gst::Query.new(__return_value)
    end

    def add_allocation_meta(api, params)
      __return_value = LibGst.query_add_allocation_meta(to_unsafe.as(LibGst::Query*), UInt64.new(api), params && params.to_unsafe.as(LibGst::Structure*))
      __return_value
    end

    def add_allocation_param(allocator, params)
      __return_value = LibGst.query_add_allocation_param(to_unsafe.as(LibGst::Query*), allocator && allocator.to_unsafe.as(LibGst::Allocator*), params && params.to_unsafe.as(LibGst::AllocationParams*))
      __return_value
    end

    def add_allocation_pool(pool, size, min_buffers, max_buffers)
      __return_value = LibGst.query_add_allocation_pool(to_unsafe.as(LibGst::Query*), pool && pool.to_unsafe.as(LibGst::BufferPool*), UInt32.new(size), UInt32.new(min_buffers), UInt32.new(max_buffers))
      __return_value
    end

    def add_buffering_range(start, stop)
      __return_value = LibGst.query_add_buffering_range(to_unsafe.as(LibGst::Query*), Int64.new(start), Int64.new(stop))
      __return_value
    end

    def add_scheduling_mode(mode : Gst::PadMode)
      __return_value = LibGst.query_add_scheduling_mode(to_unsafe.as(LibGst::Query*), mode)
      __return_value
    end

    def find_allocation_meta(api, index)
      __return_value = LibGst.query_find_allocation_meta(to_unsafe.as(LibGst::Query*), UInt64.new(api), index)
      __return_value
    end

    def n_allocation_metas
      __return_value = LibGst.query_get_n_allocation_metas(to_unsafe.as(LibGst::Query*))
      __return_value
    end

    def n_allocation_params
      __return_value = LibGst.query_get_n_allocation_params(to_unsafe.as(LibGst::Query*))
      __return_value
    end

    def n_allocation_pools
      __return_value = LibGst.query_get_n_allocation_pools(to_unsafe.as(LibGst::Query*))
      __return_value
    end

    def n_buffering_ranges
      __return_value = LibGst.query_get_n_buffering_ranges(to_unsafe.as(LibGst::Query*))
      __return_value
    end

    def n_scheduling_modes
      __return_value = LibGst.query_get_n_scheduling_modes(to_unsafe.as(LibGst::Query*))
      __return_value
    end

    def structure
      __return_value = LibGst.query_get_structure(to_unsafe.as(LibGst::Query*))
      Gst::Structure.new(__return_value)
    end

    def has_scheduling_mode(mode : Gst::PadMode)
      __return_value = LibGst.query_has_scheduling_mode(to_unsafe.as(LibGst::Query*), mode)
      __return_value
    end

    def has_scheduling_mode_with_flags(mode : Gst::PadMode, flags : Gst::SchedulingFlags)
      __return_value = LibGst.query_has_scheduling_mode_with_flags(to_unsafe.as(LibGst::Query*), mode, flags)
      __return_value
    end

    def parse_accept_caps(caps)
      __return_value = LibGst.query_parse_accept_caps(to_unsafe.as(LibGst::Query*), caps)
      __return_value
    end

    def parse_accept_caps_result(result)
      __return_value = LibGst.query_parse_accept_caps_result(to_unsafe.as(LibGst::Query*), result)
      __return_value
    end

    def parse_allocation(caps, need_pool)
      __return_value = LibGst.query_parse_allocation(to_unsafe.as(LibGst::Query*), caps, need_pool)
      __return_value
    end

    def parse_buffering_percent(busy, percent)
      __return_value = LibGst.query_parse_buffering_percent(to_unsafe.as(LibGst::Query*), busy, percent)
      __return_value
    end

    def parse_buffering_range(format : Gst::Format?, start, stop, estimated_total)
      __return_value = LibGst.query_parse_buffering_range(to_unsafe.as(LibGst::Query*), format, start, stop, estimated_total)
      __return_value
    end

    def parse_buffering_stats(mode : Gst::BufferingMode?, avg_in, avg_out, buffering_left)
      __return_value = LibGst.query_parse_buffering_stats(to_unsafe.as(LibGst::Query*), mode, avg_in, avg_out, buffering_left)
      __return_value
    end

    def parse_caps(filter)
      __return_value = LibGst.query_parse_caps(to_unsafe.as(LibGst::Query*), filter)
      __return_value
    end

    def parse_caps_result(caps)
      __return_value = LibGst.query_parse_caps_result(to_unsafe.as(LibGst::Query*), caps)
      __return_value
    end

    def parse_context(context)
      __return_value = LibGst.query_parse_context(to_unsafe.as(LibGst::Query*), context)
      __return_value
    end

    def parse_context_type(context_type)
      __return_value = LibGst.query_parse_context_type(to_unsafe.as(LibGst::Query*), context_type)
      __return_value
    end

    def parse_convert(src_format : Gst::Format?, src_value, dest_format : Gst::Format?, dest_value)
      __return_value = LibGst.query_parse_convert(to_unsafe.as(LibGst::Query*), src_format, src_value, dest_format, dest_value)
      __return_value
    end

    def parse_duration(format : Gst::Format?, duration)
      __return_value = LibGst.query_parse_duration(to_unsafe.as(LibGst::Query*), format, duration)
      __return_value
    end

    def parse_latency(live, min_latency, max_latency)
      __return_value = LibGst.query_parse_latency(to_unsafe.as(LibGst::Query*), live, min_latency, max_latency)
      __return_value
    end

    def parse_n_formats(n_formats)
      __return_value = LibGst.query_parse_n_formats(to_unsafe.as(LibGst::Query*), n_formats)
      __return_value
    end

    def parse_nth_allocation_meta(index, params)
      __return_value = LibGst.query_parse_nth_allocation_meta(to_unsafe.as(LibGst::Query*), UInt32.new(index), params)
      __return_value
    end

    def parse_nth_allocation_param(index, allocator, params)
      __return_value = LibGst.query_parse_nth_allocation_param(to_unsafe.as(LibGst::Query*), UInt32.new(index), allocator, params)
      __return_value
    end

    def parse_nth_allocation_pool(index, pool, size, min_buffers, max_buffers)
      __return_value = LibGst.query_parse_nth_allocation_pool(to_unsafe.as(LibGst::Query*), UInt32.new(index), pool, size, min_buffers, max_buffers)
      __return_value
    end

    def parse_nth_buffering_range(index, start, stop)
      __return_value = LibGst.query_parse_nth_buffering_range(to_unsafe.as(LibGst::Query*), UInt32.new(index), start, stop)
      __return_value
    end

    def parse_nth_format(nth, format : Gst::Format?)
      __return_value = LibGst.query_parse_nth_format(to_unsafe.as(LibGst::Query*), nth, format)
      __return_value
    end

    def parse_nth_scheduling_mode(index)
      __return_value = LibGst.query_parse_nth_scheduling_mode(to_unsafe.as(LibGst::Query*), UInt32.new(index))
      __return_value
    end

    def parse_position(format : Gst::Format?, cur)
      __return_value = LibGst.query_parse_position(to_unsafe.as(LibGst::Query*), format, cur)
      __return_value
    end

    def parse_scheduling(flags : Gst::SchedulingFlags?, minsize, maxsize, align)
      __return_value = LibGst.query_parse_scheduling(to_unsafe.as(LibGst::Query*), flags, minsize, maxsize, align)
      __return_value
    end

    def parse_seeking(format : Gst::Format?, seekable, segment_start, segment_end)
      __return_value = LibGst.query_parse_seeking(to_unsafe.as(LibGst::Query*), format, seekable, segment_start, segment_end)
      __return_value
    end

    def parse_segment(rate, format : Gst::Format?, start_value, stop_value)
      __return_value = LibGst.query_parse_segment(to_unsafe.as(LibGst::Query*), rate, format, start_value, stop_value)
      __return_value
    end

    def parse_uri(uri)
      __return_value = LibGst.query_parse_uri(to_unsafe.as(LibGst::Query*), uri)
      __return_value
    end

    def parse_uri_redirection(uri)
      __return_value = LibGst.query_parse_uri_redirection(to_unsafe.as(LibGst::Query*), uri)
      __return_value
    end

    def parse_uri_redirection_permanent(permanent)
      __return_value = LibGst.query_parse_uri_redirection_permanent(to_unsafe.as(LibGst::Query*), permanent)
      __return_value
    end

    def remove_nth_allocation_meta(index)
      __return_value = LibGst.query_remove_nth_allocation_meta(to_unsafe.as(LibGst::Query*), UInt32.new(index))
      __return_value
    end

    def remove_nth_allocation_param(index)
      __return_value = LibGst.query_remove_nth_allocation_param(to_unsafe.as(LibGst::Query*), UInt32.new(index))
      __return_value
    end

    def remove_nth_allocation_pool(index)
      __return_value = LibGst.query_remove_nth_allocation_pool(to_unsafe.as(LibGst::Query*), UInt32.new(index))
      __return_value
    end

    def accept_caps_result=(result)
      __return_value = LibGst.query_set_accept_caps_result(to_unsafe.as(LibGst::Query*), result)
      __return_value
    end

    def set_buffering_percent(busy, percent)
      __return_value = LibGst.query_set_buffering_percent(to_unsafe.as(LibGst::Query*), busy, Int32.new(percent))
      __return_value
    end

    def set_buffering_range(format : Gst::Format, start, stop, estimated_total)
      __return_value = LibGst.query_set_buffering_range(to_unsafe.as(LibGst::Query*), format, Int64.new(start), Int64.new(stop), Int64.new(estimated_total))
      __return_value
    end

    def set_buffering_stats(mode : Gst::BufferingMode, avg_in, avg_out, buffering_left)
      __return_value = LibGst.query_set_buffering_stats(to_unsafe.as(LibGst::Query*), mode, Int32.new(avg_in), Int32.new(avg_out), Int64.new(buffering_left))
      __return_value
    end

    def caps_result=(caps)
      __return_value = LibGst.query_set_caps_result(to_unsafe.as(LibGst::Query*), caps.to_unsafe.as(LibGst::Caps*))
      __return_value
    end

    def context=(context)
      __return_value = LibGst.query_set_context(to_unsafe.as(LibGst::Query*), context.to_unsafe.as(LibGst::Context*))
      __return_value
    end

    def set_convert(src_format : Gst::Format, src_value, dest_format : Gst::Format, dest_value)
      __return_value = LibGst.query_set_convert(to_unsafe.as(LibGst::Query*), src_format, Int64.new(src_value), dest_format, Int64.new(dest_value))
      __return_value
    end

    def set_duration(format : Gst::Format, duration)
      __return_value = LibGst.query_set_duration(to_unsafe.as(LibGst::Query*), format, Int64.new(duration))
      __return_value
    end

    def set_formatsv(n_formats, formats)
      __return_value = LibGst.query_set_formatsv(to_unsafe.as(LibGst::Query*), Int32.new(n_formats), formats)
      __return_value
    end

    def set_latency(live, min_latency, max_latency)
      __return_value = LibGst.query_set_latency(to_unsafe.as(LibGst::Query*), live, UInt64.new(min_latency), UInt64.new(max_latency))
      __return_value
    end

    def set_nth_allocation_param(index, allocator, params)
      __return_value = LibGst.query_set_nth_allocation_param(to_unsafe.as(LibGst::Query*), UInt32.new(index), allocator && allocator.to_unsafe.as(LibGst::Allocator*), params && params.to_unsafe.as(LibGst::AllocationParams*))
      __return_value
    end

    def set_nth_allocation_pool(index, pool, size, min_buffers, max_buffers)
      __return_value = LibGst.query_set_nth_allocation_pool(to_unsafe.as(LibGst::Query*), UInt32.new(index), pool && pool.to_unsafe.as(LibGst::BufferPool*), UInt32.new(size), UInt32.new(min_buffers), UInt32.new(max_buffers))
      __return_value
    end

    def set_position(format : Gst::Format, cur)
      __return_value = LibGst.query_set_position(to_unsafe.as(LibGst::Query*), format, Int64.new(cur))
      __return_value
    end

    def set_scheduling(flags : Gst::SchedulingFlags, minsize, maxsize, align)
      __return_value = LibGst.query_set_scheduling(to_unsafe.as(LibGst::Query*), flags, Int32.new(minsize), Int32.new(maxsize), Int32.new(align))
      __return_value
    end

    def set_seeking(format : Gst::Format, seekable, segment_start, segment_end)
      __return_value = LibGst.query_set_seeking(to_unsafe.as(LibGst::Query*), format, seekable, Int64.new(segment_start), Int64.new(segment_end))
      __return_value
    end

    def set_segment(rate, format : Gst::Format, start_value, stop_value)
      __return_value = LibGst.query_set_segment(to_unsafe.as(LibGst::Query*), Float64.new(rate), format, Int64.new(start_value), Int64.new(stop_value))
      __return_value
    end

    def uri=(uri)
      __return_value = LibGst.query_set_uri(to_unsafe.as(LibGst::Query*), uri.to_unsafe)
      __return_value
    end

    def uri_redirection=(uri)
      __return_value = LibGst.query_set_uri_redirection(to_unsafe.as(LibGst::Query*), uri.to_unsafe)
      __return_value
    end

    def uri_redirection_permanent=(permanent)
      __return_value = LibGst.query_set_uri_redirection_permanent(to_unsafe.as(LibGst::Query*), permanent)
      __return_value
    end

    def writable_structure
      __return_value = LibGst.query_writable_structure(to_unsafe.as(LibGst::Query*))
      Gst::Structure.new(__return_value)
    end

    def mini_object
      Gst::MiniObject.new((to_unsafe.as(LibGst::Query*).value.mini_object))
    end

    def mini_object=(value : Gst::MiniObject)
      to_unsafe.as(LibGst::Query*).value.mini_object = value
    end

    def type
      (to_unsafe.as(LibGst::Query*).value.type)
    end

    def type=(value : Gst::QueryType)
      to_unsafe.as(LibGst::Query*).value.type = value
    end

  end
end

