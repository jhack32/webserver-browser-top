require 'socket'

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

while line = s.gets #Read lines from socket
  puts line.chop  #print with platform line terminator
end
s.close #Close socket when done
