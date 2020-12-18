import Foundation

print("Hello, World!")
let r = URLRequest(url: URL(string: "https://phobos.apple.com./version")!)
URLSession.shared.dataTask(with: r, completionHandler: { data, response, error in
    print(response)
    if let d = data {
        print(d)
    }
})
