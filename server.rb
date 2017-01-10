require 'thrift'
require_relative 'gen-rb/add_service'

class Handler
  def initialize()
    @log = {}
  end

  def ping()
    puts "ping()"
  end

  def add(a, b)
	puts "adding a+b ....."
	return a + b
  end
end


handler = Handler.new()
processor = Addservice::AddService::Processor.new(handler)
transport = Thrift::ServerSocket.new(9090)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::SimpleServer.new(processor, transport, transportFactory)

puts "Starting the server..."
server.serve()
