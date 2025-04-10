class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts ">>> GuestsCleanupJob is running with args: #{args.inspect}"
    # $stdout.flush
  end
end
