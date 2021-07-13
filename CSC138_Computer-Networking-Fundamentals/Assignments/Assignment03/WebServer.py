# Importing
from socket import * 
import sys

# Prepare a server socket on a particular port
serverSocket = socket(AF_INET, SOCK_STREAM)
port = 6789
serverSocket.bind(('',port))
serverSocket.listen(1)

while True:
    # Establish the connection
    print("Ready to serve...")
    connectionSocket, addr = serverSocket.accept()
    
    try:
        message = connectionSocket.recv(1024)
        filename = message.split()[1]                 
        f = open(filename[1:])
        outputdata = f.read()
        f.close()
        # Send HTTP header line(s)into socket
        connectionSocket.send('HTTP/1.1 200 OK\r\n')
        # Send the content of the requested file to the client
        for i in range(0, len(outputdata)):
            connectionSocket.send(outputdata[i].encode())
        connectionSocket.send("\r\n".encode())
        connectionSocket.close()
    except IOError:
        # Send response message for file not found
        connectionSocket.send('HTTP/1.1 404 Not Found\r\n')
        # Close client socket
        connectionSocket.close()

serverSocket.close()
sys.exit()