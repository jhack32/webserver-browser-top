require 'socket' #Using socket library

host = 'www.tutorialspoint.com'
port = 80
path = '/index.html'

# This is the HTML request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host, port) #connect to server
socket.print(request) #Send request
response = socket.read #Read complete response

#Split response at first blank line into headers and body
headers, body = response.split("\r\n\r\n", 2)

print body #Displays it

=begin

To implement the similar web client,
you can use a prebuilt library like Net::HTTP for working with HTTP.
Here is code that does the equivalent of the previous code:

require 'net/http'                  # The library we need
host = 'www.tutorialspoint.com'     # The web server
path = '/index.htm'                 # The file we want

http = Net::HTTP.new(host)          # Create a connection
headers, body = http.get(path)      # Request the file
if headers.code == "200"            # Check the status code
  print body
else
  puts "#{headers.code} #{headers.message}"
end

=end
