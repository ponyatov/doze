import std.stdio;

HTTPServerSettings settings = null;
URLRouter router = null;

static this() {
    settings = new HTTPServerSettings;
    settings.port = 12345;
    settings.bindAddresses = ["127.0.0.1"];
    settings.errorPageHandler = toDelegate(&error);
    router = new URLRouter;
}

import vibe.vibe;

void main(string[] args) {
    writeln(args);
    router.get("/", &index);
    router.get("/hello", &hello);
    router.get("/about", &about);
    listenHTTP(settings, router);
    runApplication();
}

void error(HTTPServerRequest req, HTTPServerResponse res,
        HTTPServerErrorInfo err) {
    res.render!("error.dt", req, err);
}

void index(HTTPServerRequest req, HTTPServerResponse res) {
    res.render!("index.dt", req);
}

void hello(HTTPServerRequest req, HTTPServerResponse res) {
    res.writeBody("Hello, World!");
}

void about(HTTPServerRequest req, HTTPServerResponse res) {
    res.render!("about.dt", req);
}
