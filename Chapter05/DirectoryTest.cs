using System;
using System.IO;

class Program {
    static void Main(string[] args) {

    }
}
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