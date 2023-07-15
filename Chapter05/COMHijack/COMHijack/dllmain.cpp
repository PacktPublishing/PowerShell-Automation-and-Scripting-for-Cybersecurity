#include "pch.h"
#include <string>

DWORD WINAPI CallCalculator() {
    STARTUPINFO info = { 0 };
    PROCESS_INFORMATION processInfo = { 0 };

    wchar_t windowsDir[MAX_PATH];
    if (GetWindowsDirectory(windowsDir, MAX_PATH) == 0) {
        return 1;
    }
    std::wstring cmd = std::wstring(windowsDir) + L"\\System32\\calc.exe";

    info.cb = sizeof(info);
    BOOL ProcessLaunched = CreateProcess((LPWSTR)cmd.c_str(), NULL, NULL, NULL, TRUE, 0, NULL, NULL, &info, &processInfo);
    if (ProcessLaunched == FALSE) {
        return 1;
    }

    CloseHandle(processInfo.hProcess);
    CloseHandle(processInfo.hThread);

    return 0;
}

BOOL APIENTRY DllMain(HMODULE hModule,
    DWORD  ul_reason_for_call,
    LPVOID lpReserved
)
{
    if (DLL_PROCESS_ATTACH == ul_reason_for_call) { CallCalculator(); }
    return TRUE;
}