//
//  RelatedTopicsResponse.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import Foundation

// Define the RelatedTopicsResponse struct, conforming to Decodable.
struct RelatedTopicsResponse: Decodable {
    let relatedTopics: [Character]

    // Define the CodingKeys enum to map JSON keys to the properties of our RelatedTopicsResponse struct.
    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}
