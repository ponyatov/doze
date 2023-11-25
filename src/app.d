module app;

version (Windows) {
    import core.runtime;
    import core.sys.windows.windows;
}

import std.stdio;
import std.string;

class App {
    string[] args;

    version (Windows) {
        import std.uni : isWhite;

        this(LPSTR lpCmdLine) {
            args = [];
            writefln("[%s]", fromStringz(lpCmdLine));
        }
    }

    this(string[] args) {
        this.args = args;
    }
}
