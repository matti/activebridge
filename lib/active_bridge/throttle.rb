# frozen_string_literal: true

module ActiveBridge
  def throttle(started_at, max)
    took = Time.now - started_at
    remaining = max - took
    sleep remaining if remaining > 0
    remaining
  end
end
