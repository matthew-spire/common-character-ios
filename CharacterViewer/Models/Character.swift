//
//  Character.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

// Import the Foundation framework to use the necessary data types, such as URL.
import Foundation

// Define the Character struct, conforming to Identifiable and Decodable.
struct Character: Identifiable, Decodable {
    let id = UUID() // Generate a unique ID for each character since the JSON does not provide one
    let firstURL: URL
    let iconURL: String?
    let result: String
    let text: String

    // Define the CodingKeys enum to map JSON keys to the properties of our Character struct.
    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case iconURL = "Icon"
        case result = "Result"
        case text = "Text"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstURL = try container.decode(URL.self, forKey: .firstURL)
        result = try container.decode(String.self, forKey: .result)
        text = try container.decode(String.self, forKey: .text)

        // Custom decoding for iconURL
        let iconContainer = try container.nestedContainer(keyedBy: IconCodingKeys.self, forKey: .iconURL)
        iconURL = try iconContainer.decodeIfPresent(String.self, forKey: .url)
    }

    enum IconCodingKeys: String, CodingKey {
        case url = "URL"
    }
}
