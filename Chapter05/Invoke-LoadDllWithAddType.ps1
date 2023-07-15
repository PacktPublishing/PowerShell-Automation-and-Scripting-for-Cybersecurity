Add-Type -TypeDefinition 'public class test {
    public static void Main() { System.Console.WriteLine("Hello World!");
    }
}' -OutputAssembly "$env:TEMP\test.dll"
$type = Add-Type -Path $env:TEMP\test.dll -PassThru
$type::Main()