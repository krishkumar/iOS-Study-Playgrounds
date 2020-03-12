import UIKit
import Combine

// MARK: - Welcome
struct Welcome: Codable {
    let status, copyright, section: String
    let lastUpdated: String
    let numResults: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case status, copyright, section
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let section, subsection, title, abstract: String
    let url: String
    let uri, byline: String
    let itemType: ItemType
    let updatedDate, createdDate, publishedDate: String
    let materialTypeFacet, kicker: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let multimedia: [Multimedia]
    let shortURL: String

    enum CodingKeys: String, CodingKey {
        case section, subsection, title, abstract, url, uri, byline
        case itemType = "item_type"
        case updatedDate = "updated_date"
        case createdDate = "created_date"
        case publishedDate = "published_date"
        case materialTypeFacet = "material_type_facet"
        case kicker
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case multimedia
        case shortURL = "short_url"
    }
}

enum ItemType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let url: String
    let format: Format
    let height, width: Int
    let type: TypeEnum
    let subtype: Subtype
    let caption, copyright: String
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case normal = "Normal"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
    case thumbLarge = "thumbLarge"
}

enum Subtype: String, Codable {
    case photo = "photo"
    case photoillustration = "photoillustration"
}

enum TypeEnum: String, Codable {
    case image = "image"
}

func getData(completionHandler: @escaping (_ welcome: Welcome?) -> ()) {
    var welcome: Welcome?
    let task = URLSession.shared.dataTask(with: URL(string: "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=j1ZRT1DqIzA09dQ6gJzjwO9Gox0mbJyO")!) { (data, response, error) in
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
        //print(dataObject.copyright)
        for result in dataObject.results {
            //print(result.abstract)
        }
    }
    //print("✅")
}

// combine
let networkService = URLSession.shared.dataTaskPublisher(for: URL(string: "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=j1ZRT1DqIzA09dQ6gJzjwO9Gox0mbJyO")!)
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

