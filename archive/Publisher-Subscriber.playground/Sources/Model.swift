import Foundation

// MARK: - Welcome
public enum NetworkRouter {

    case getWelcome
public var endpoint: String {
    switch self {
    case .getWelcome:
        return "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=j1ZRT1DqIzA09dQ6gJzjwO9Gox0mbJyO"
        }
    }
}

public struct Welcome: Codable {
    public let status, copyright, section: String
    let lastUpdated: String
    let numResults: Int
    public let results: [Result]

    enum CodingKeys: String, CodingKey {
        case status, copyright, section
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
public struct Result: Codable {
    public let section, subsection, title, abstract: String
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

public enum ItemType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
}

// MARK: - Multimedia
public struct Multimedia: Codable {
    let url: String
    let format: Format
    let height, width: Int
    let type: TypeEnum
    let subtype: Subtype
    let caption, copyright: String
}

public enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case normal = "Normal"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
    case thumbLarge = "thumbLarge"
}

public enum Subtype: String, Codable {
    case photo = "photo"
    case photoillustration = "photoillustration"
}

public enum TypeEnum: String, Codable {
    case image = "image"
}
