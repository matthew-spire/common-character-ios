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

    // The custom initializer is responsible for decoding the JSON data based on the defined CodingKeys and IconCodingKeys enums.
    init(from decoder: Decoder) throws {
        // Create a container to hold the key-value pairs from the JSON data.
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Decode the values for firstURL, result, and text properties.
        firstURL = try container.decode(URL.self, forKey: .firstURL)
        result = try container.decode(String.self, forKey: .result)
        text = try container.decode(String.self, forKey: .text)

        // Custom decoding for iconURL, which is a nested object in the JSON data.
        // Create a nested container specifically for the Icon property (object) using the IconCodingKeys enum.
        let iconContainer = try container.nestedContainer(keyedBy: IconCodingKeys.self, forKey: .iconURL)
        // Decode the value for the iconURL property if it is present in the JSON data.
        iconURL = try iconContainer.decodeIfPresent(String.self, forKey: .url)
    }

    // Define a separate nested CodingKeys enum for the Icon property (object), which maps the "URL" key in the JSON data to the "url" property in the Character struct.
    enum IconCodingKeys: String, CodingKey {
        case url = "URL"
    }
}
