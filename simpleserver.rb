require 'socket'

server = TCPServer.open(2000)  #Socket to listen on port 2000

loop {  # Server runs forever
  client = server.accept  #Wait for client to connect
  
  #client.puts(Time.now.ctime) #Send time to client
  #client.puts "Closing the connection. Bye!" #Sends message to client
  #client.close #Closes connection. Disconnect from the client
}
