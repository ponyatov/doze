version (Windows) {
    import core.runtime;
    import core.sys.windows.windows;
}

import std.stdio;
import std.string;

version (Windows) {
    // https://github.com/AndrejMitrovic/DWinProgramming

    extern (Windows) int WinMain(HINSTANCE hInstance,
            HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
        int result;

        try {
            Runtime.initialize();
            result = myWinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow);
            Runtime.terminate();
        } catch (Throwable e) {
            MessageBoxA(null, e.toString().toStringz(),
                    null, MB_ICONEXCLAMATION);
            result = 0; // failed
        }

        return result;
    }

    int myWinMain(HINSTANCE hInstance,
            HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
        writeln(lpCmdLine);
        return 0;
    }

} else {

    void main(string[] args) {
        writeln(args);
    }
}
