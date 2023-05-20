using System;
using System.Management.Automation;
using System.Collections.ObjectModel;

namespace RunPoSh
{
    class Program
    {
        static void Main(string[] args)
        {
            using (PowerShell PoSh = PowerShell.Create())
            {
                if (args.Length >= 1)
                {
                    String totalArgs = "";
                    for (int argCnt = 0; argCnt < args.Length; argCnt++)
                    {
                        if (totalArgs=="")
                        {
                            totalArgs += args[argCnt];
                        }
                        else
                        {
                            totalArgs += " " + args[argCnt];
                        }
                    }
                    totalArgs += " | Out-String";
                    PoSh.AddScript(totalArgs);
                    Collection<PSObject> PSOutput;
                    PSOutput = PoSh.Invoke();
                    foreach (PSObject outputItem in PSOutput)
                    {
                        if (outputItem != null)
                        {
                            Console.WriteLine(outputItem);
                        }
                    }
                }
                else
                {
                    Console.WriteLine("No input was specified. Please specify a command to execute.\r\nExample: RunPoSh.exe Get-Process");
                }
            }
        }
    }
}