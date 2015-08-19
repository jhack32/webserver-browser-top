require 'socket'
require 'json'

hostname = 'localhost'
port = 2000

puts "Welcome to the Simple Web Browser!"
print "What do you want to do? (GET or POST) "
input = gets.chomp.upcase

  def thanks_data
    puts "Form to register for a Viking Raid. "
    puts "Please enter a name"
    name = gets.chomp
    puts "Now please enter an email"
    email = gets.chomp
    hash_form = {:viking => {:name => name, :email => email}}
    data = hash_form.to_json
    puts data
    return data
  end

      if input == "GET"
        path = './index.html'
        request = "GET #{path} HTTP/1.0\r\n\r\n"
      elsif input == "POST"
        submit_data = thanks_data
        puts submit_data
        request = "POST ./thanks.html HTTP/1.0\nContent-Type: JSON\nContent-Length: #{submit_data.size}\r\n\r\n#{submit_data}"
      else
        puts "Invalid input, please try again"
    end

#while line = s.gets #Read lines from socket
#  puts line.chop  #print with platform line terminator
#end

socket = TCPSocket.open(hostname, port)
socket.print(request)
response = socket.read

header, body = response.split("\r\n\r\n", 2)
print body
socket.close #Close socket when done
