import Vapor
import WingedSwift

func routes(_ app: Application) throws {
    app.get { req in
        let helloDiv = Div(content: "Hello World")
        
        let response = Response()
        response.body = .init(string: helloDiv.render()) // Init Body
        return response.encodeResponse(status: .ok,
                                       headers: HTTPHeaders.init([("Content-Type",
                                                                   "text/html; charset=UTF-8")]),
                                       for: req)
    }

    app.get("hello") { req in
        let document = html {
            Head(children: [
                Meta(name: "description", content: "A description of the page"),
                Link(href: "https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css", rel: "stylesheet")
            ])
            Body(children: [
                Header(children: [
                    Nav(children: [
                        A(href: "#home", content: "Home"),
                        A(href: "#about", content: "About"),
                        A(href: "#contact", content: "Contact")
                    ])
                ]),
                MainTag(children: [
                    P(content: "Welcome to our website!")
                ]),
                Footer(children: [
                    P(content: "© 2024 Company, Inc.")
                ])
            ])
        }

        let response = Response()
        response.body = .init(string: document.render()) // Init Body
        return response.encodeResponse(status: .ok,
                                       headers: HTTPHeaders.init([("Content-Type",
                                                                   "text/html; charset=UTF-8")]),
                                       for: req)
    }
}
