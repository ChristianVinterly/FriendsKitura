import Foundation
import Kitura
import HeliumLogger

HeliumLogger.use()

let router = Router()
router.get("/") { request, response, next in
    response.send("Hello world")
    next()
}

let port: Int
let defaultPort = 8080
if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
    port = Int(requestedPort) ?? defaultPort
} else {
    port = defaultPort
}

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
