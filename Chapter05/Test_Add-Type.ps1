$Source = @"
using System;
using System.IO;

public class DirectoryTest
{

    public static string[] GetDirectories(string path)
    {
        string[] dirs;

        try
        {
            dirs = Directory.GetDirectories(@path, "*", SearchOption.TopDirectoryOnly);
        }
        catch (System.UnauthorizedAccessException)
        {
            dirs = new string[0];
        }

        return dirs;
    }
}
"@

Add-Type -TypeDefinition $Source

[DirectoryTest]::GetDirectories("C:\")