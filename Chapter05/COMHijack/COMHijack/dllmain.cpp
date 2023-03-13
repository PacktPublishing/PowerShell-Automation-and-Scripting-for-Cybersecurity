#include "pch.h"
#include <string>

DWORD WINAPI CallCalculator(LPVOID lpParam) {
    STARTUPINFO info = { 0 };
    PROCESS_INFORMATION processInfo;
    std::wstring cmd = L"C:\\Windows\\System32\\calc.exe";
    BOOL hR = CreateProcess((LPWSTR)cmd.c_str(), NULL, NULL, NULL, TRUE, 0, NULL, NULL, &info, &processInfo);
    if (hR == 0) {
        return 1;
    }
    return 0;
}

BOOL APIENTRY DllMain(HMODULE hModule,
    DWORD  ul_reason_for_call,
    LPVOID lpReserved
)
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
    {
        CallCalculator(NULL);
        break;
    }
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}