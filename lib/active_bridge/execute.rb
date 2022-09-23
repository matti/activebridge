# frozen_string_literal: true

module ActiveBridge
  def execute(opts = {}, &block)
    queue = Queue.new
    timeout_thr = if opts[:timeout]
      Thread.new do
        queue.push [:timeout, sleep(opts[:timeout])]
      end
    end
    started_at = Time.now
    main_thr = Thread.new do
      queue.push [:ok, block.call]
    end

    op, value = queue.pop
    took = Time.now - started_at

    timeout_thr&.kill
    main_thr.kill
    main_thr.kill
    main_thr.kill

    case op
    when :timeout
      [:timeout, took, nil]
    when :ok
      [:ok, took, value]
    else
      raise "well, this is interesting"
    end
  end
end
