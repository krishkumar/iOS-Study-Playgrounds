import UIKit
import Combine

// combine
let networkService = URLSession.shared.dataTaskPublisher(for: URL(string: NetworkRouter.getWelcome.endpoint)!)
    .map { $0.data }
    .decode(type: Welcome.self, decoder: JSONDecoder())
    .mapError { (mapError) -> Error in
        return mapError
}.eraseToAnyPublisher()

let subscriber = networkService.sink(receiveCompletion: { (completion) in
    switch completion {
    case .failure(let error):
        print(error)
    case .finished:
        break
    }
}) { (welcome) in
    for story in welcome.results {
        print(story.abstract)
    }
}
print("✅✅")

