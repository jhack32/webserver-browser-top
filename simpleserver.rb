require 'socket'
require 'json'

server = TCPServer.open(2000)  #Socket to listen on port 2000

loop {  # Server runs forever
  client = server.accept  #Wait for client to connect
  header_lines = ""
  while line = client.gets
		header_lines += line
		break if header_lines =~ /\r\n\r\n$/
	end

	header = header_lines.split("\n")
	request = header[0].split(" ")

	method = request[0]
	filepath = request[1]
  http = request[2]

	puts method
	puts filepath
  puts http

  if File.exists?(filepath)

    file = File.read(filepath)
    client.print("#{http} 200 OK\r\nContent-Type: text/html\r\n Content-Length: #{File.size(filepath)}\r\n\r\n")
      if method == "GET"
        client.puts(file)
      elsif method == "POST"
        readBody = header[-2].split(" ")[1].to_i
        body = client.read(readBody)
        params = JSON.parse(body)
        puts params
        puts params.keys
        data = "<li>Name: #{params['viking']['name']}</li><li>Email: #{params['viking']['email']}</li>"
        puts data
        file = file.gsub("<%= yield %>", data)
        client.puts "#{http} 200 OK\nContent-Type: html\nContent-Length: #{file.size}\r\n\r\n#{file}"
      end
  else
    client.puts("HTTP/1.0 404 Not Found")
  end

  #client.puts(Time.now.ctime) #Send time to client
  #client.puts "Closing the connection. Bye!" #Sends message to client
  client.close #Closes connection. Disconnect from the client
}
