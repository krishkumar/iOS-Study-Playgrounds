//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

func getData(completionHandler: @escaping (_ welcome: Welcome?) -> ()) {
    var welcome: Welcome?
    let task = URLSession.shared.dataTask(with: URL(string: NetworkRouter.getWelcome.endpoint)!) { (data, response, error) in
        //
        if let jsonData = data {
            do {
                welcome = try JSONDecoder().decode(Welcome.self, from: jsonData)
            }
            catch {
                print(error)
            }
        }
        completionHandler(welcome)
    }
    task.resume()
}

getData { data in
    if let dataObject = data {
        print(dataObject.copyright)
        for result in dataObject.results {
            print(result.abstract)
        }
    }
    print("✅")
}
