#!/usr/bin/env ruby
require 'thread'
require 'drb'

NAME = ARGV.shift or raise "Usage: #{File.basename($0)} CLIENT_NAME"

DRb.start_service
queue = DRbObject.new_with_uri("druby://127.0.0.1:61676")

20.times do
  queue.enq('request' => ['Report', 'Process'][rand(2)], 'from' => NAME)
end
