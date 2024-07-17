import Vapor
import WingedSwift

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req in
        let helloDiv = Div(content: "Hello World")
        
        let response = Response()
        response.body = .init(string: helloDiv.render()) // Init Body
        return response.encodeResponse(status: .ok,
                                       headers: HTTPHeaders.init([("Content-Type", 
                                                                   "text/html; charset=UTF-8")]),
                                       for: req)
    }
}
