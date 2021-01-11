import Foundation

let link = "https://jsonplaceholder.typicode.com/posts"

var sema = DispatchSemaphore( value: 0 )

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config, delegate: Delegate(), delegateQueue: nil )
guard let url = URL( string:link ) else { fatalError("Could not create URL object") }
session.dataTask( with: url ).resume()    
sema.wait()


class Delegate : NSObject, URLSessionDataDelegate
{
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data)
    {
        print("\(String(data: data, encoding: .utf8 ) ?? "<empty>")");
        sema.signal()
    }
}
