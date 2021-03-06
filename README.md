# webserver-browser-top
Your Task

    Read this explanation of how HTTP works down through where it talks about the POST method (about halfway down), if you haven't already.
    Read this brief tutorial on Ruby socket programming from TutorialsPoint. Don't worry about the Multi-Client server stuff too much, but keep reading past it.

    In one file, implement their "A Simple Server". It's easy to copy/paste code, but make sure you conceptually understand what each line is doing.
        Ready to get your mind blown? When you call TCPServer.open, the ::open class method is the EXACT same method that you use to call File.open because TCPServer inherits (several levels up) from the same IO class that File does! Another way working with servers is like working with files.
        #accept is just an instance method of the TCPServer class. It waits around for a connection, and when it gets a connection, it returns the TCPSocket representing that connection (see the docs).
        Now when you #puts to that socket, it gets picked up on the other side by your client. Not magic at all, just a stream of bytes like typing into the STDIN from the command line using #gets or to STDOUT using #puts.

    In another file, implement their "A Simple Client". This should really look a lot like working with files. localhost just represents the address of your current computer (as opposed to, say http://www.google.com). Whenever you're building web applications and need to test them locally before deploying, you'll run a local server whose address will be localhost and some port number (often 3000, but that's arbitrary). So get familiar with it!

    In one tab of your terminal, run your server. Press CTRL + c to break from the infinite loop when you want to stop it.

    In another tab, run your client. You should see whatever you told the server to print get puts'd to the command line. Congratulations, you just built a server!

    Now let's crank it up a little bit. Build the "A Tiny Web Browser" from the same TutorialsPoint article (the first version) and test it out against some existing webpages. That's basically just the same thing you built before but pointing at the web instead of your localhost.

    Create an HTML file and save it as index.html. It should look like:

        <html>
          <body>
            <h1>Welcome to the Viking Home Page</h1>
          </body>
        </html>

    Now comes the fun part. Modify your simple server to take the HTTP request from the browser and, if it is a GET request that points to /index.html, send back the contents of index.html.
        You'll need to parse the incoming request yourself to determine which verb is being used, which file it wants, and other similar information that's contained in a standard HTTP request. Again, check the examples here for what HTTP requests look like as a reference. The easiest way may be to use a Regular Expression.
        Send your own properly formatted HTTP response, including a status code of 200 if the file is found, and then the actual contents of the requested file. Don't forget to include the size (in characters) of the outgoing file (this is a normal part of every HTTP response) to help you display it using your mini-browser.
        If it asks for another file that doesn't exist, send back an error code (like 404) and an appropriate (or inappropriate) error message.

    Modify your simple web browser to send the appropriate GET request to your web server, just like you did earlier with the really simple client/server combo. Test it out... you should be able to ask for and retrieve the index.html file (and puts it into the terminal)! This will require you to remember some of the commands you used to open files. You should also set it up to identify when you've got back an error code and display the error message.

    Build another HTML file called thanks.html. It should look like:

        <html>
          <body>
            <h1>Thanks for Posting!</h1>
            <h2>Here's what we got from you:</h2>
            <ul>
              <%= yield %>
            </ul>
          </body>
        </html>

    Now set up your mini web browser client to also send POST requests. Where before we were pretending to be browsing the web, now we're going to pretend that we just pushed the "submit" button on a form and need to send the form data to your server.
        Modify your client to ask the user which type of request the user wants to send.
        If the user wants to send a POST request, pretend you're registering a viking for a raid. Ask the user for a couple of pieces of data about the viking, including a name and an email.
        Store the results of this in a hash-inside-a-hash, which might end up looking like {:viking => {:name=>"Erik the Red", :email=>"erikthered@theodinproject.com"} }. Why the hash-in-a-hash? Because this is exactly what it will look like when your browser sends data back from a Rails-generated form. You could just use a normal hash, but that would be less fun.
        When you send the POST request, this time include your data hash as part of the request (again, see the examples here). You'll want to use the JSON format to transmit your hash, which means you need to add the require 'json' line at the top of your server and client to use the JSON library.
        The method that converts your hash object into a flat JSON string for easy HTTP transmission is #to_json.
        You'll also need to include the size of the data you're sending in the Content-Length field of the HTTP packet.

    Finally, set up your server to recognize and respond to a POST request.
        If the server detects a POST request, you should identify and parse out the JSON data from it (it will probably be helpful to use the Content-Length line you included to break out the data)
        Turn that JSON string back into an object by using JSON.parse and save that in another hash that we'll call params (again because this is what Rails does). Your code might look like params = {}; params << JSON.parse(the_post_JSON_string_here).
        Now open the thanks.html file and (without modifying the original file since you will want to use it multiple times) use your script to replace the line <%= yield %> with a new <li> for each one of the data items that you originally entered in your "form" back in your browser. Display these in whatever format you'd like, for instance <li>Name: Erik the Red</li><li>Email: erikthered@theodinproject.com</li>.
        Now send that modified file back to your mini-browser and show it.

    Play with your new browser! Try submitting different things into your name and email fields and watch them pop back up in the html that gets sent back. It's not magic, it's HTTP and Ruby.

Holy cow! You just built a command line web browser that sends actual HTTP requests and a web server that can actually interpret those requests, load up files, modify those files based on the inputs, and send them back to your browser. Take a second to pat yourself on the back.

Now think about what you did. Let it sink in, including some of the steps that seemed a little odd, like using a hash named params and replacing the line in the thanks.html file called <%= yield %> with some dynamically generated HTML. Those are the types of things that Rails does. That's right, you sort of maybe built a little piece of Rails. Good work.


I had trouble while completing this project and had some guidance.
