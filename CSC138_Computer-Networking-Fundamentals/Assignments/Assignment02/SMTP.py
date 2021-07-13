from socket import *

msg = "\r\n I love Computer Networks!"
endMsg = "\r\n.\r\n"

mailserver = 'localhost'
port = 25 

sender = "<mariopalacios@csus.edu>"
recipient = "<m97palacios@gmail.com>"

# TCP connection with mailserver
clientSocket = socket(AF_INET,SOCK_STREAM)
clientSocket.connect((mailserver,port))
recv = clientSocket.recv(1024).decode()
print (recv)
if recv[:3] != '220':
        print ("220 reply NOT received from server.")

# HELLO command with server response
print("This is the HELLO command")
helloCmd = "Hello MARIO \r\n"
clientSocket.send(helloCmd.encode())
recv1 = clientSocket.recv(1024).decode()
print (recv1)
if recv1[:3] != '250':
        print ("250 reply NOT received from server.")
print ("\nAccessing MAIL FROM command ... \n")

# MAIL FROM command with server response
print ("This is the MAIL FROM command")
mailFromCmd = "Mail from: " + sender + "\r\n"
clientSocket.send(mailFromCmd.encode())
recv1 = clientSocket.recv(1024).decode()
print (recv1)
if recv1[:3] != '250':
        print ("250 reply NOT received from server.")
print ("\nAccessing RCPT TO command ... \n")

# RCPT TO command with server response
print ("This is the RCPT TO comamnd.")
rcptToCmd = "RCPT TO: " + recipient + "\r\n"
clientSocket.send(rcptToCmd.encode())
recv1 = clientSocket.recv(1024).decode()
print (recv1)
if recv1[:3] != '250':
        print ("250 reply NOT received from server")
print ("\nAccessing DATA command ... \n")

# DATA command and server reponse
print ("This is the DATA command")
dataCmd = "Data\r\n"
clientSocket.send(dataCmd.encode())
recv1 = clientSocket.recv(1024).decode()
print (recv1)
if recv1[:3] != '354':
        print ("354 reply NOT received from server")

# SEND message data
print ("\nSending data ... \n")
sendMsg = msg + endMsg
clientSocket.send(sendMsg.encode())
recv1 = clientSocket.recv(1024).decode()
print (recv1)
if recv1[:3] != '250':
        print ("250 reply NOT received from server")

# Message ends with a single period
print (".")

# QUIT command with server response 
print ("This is the QUIT command.")
quitCmd = "Quit\r\n"
clientSocket.send(quitCmd.encode())
recv1 = clientSocket.recv(1024).decode()
print (recv1)
if recv1[:3] != '221':
        print ("221 reply NOT recieved from server.")

clientSocket.close()
