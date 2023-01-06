$listener = New-Object System.Net.Sockets.TcpListener([System.Net.IPAddress]::Any, 4444)
$listener.Start()
$client = $listener.AcceptTcpClient()

# Send data to the client
$stream = $client.GetStream()
$bytes = [System.Text.Encoding]::ASCII.GetBytes("Write-Host 'Hello world!'")
$stream.Write($bytes, 0, $bytes.Length)

# Close the connection
$client.Close()