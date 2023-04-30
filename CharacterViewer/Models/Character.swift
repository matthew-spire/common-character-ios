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
    let iconURL: URL?
    let result: String
    let text: String

    // Define the CodingKeys enum to map JSON keys to the properties of our Character struct.
    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case iconURL = "Icon.URL"
        case result = "Result"
        case text = "Text"
    }
}
