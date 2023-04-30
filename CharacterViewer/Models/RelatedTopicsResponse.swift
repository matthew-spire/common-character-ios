//
//  RelatedTopicsResponse.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import Foundation

struct RelatedTopicsResponse: Decodable {
    let relatedTopics: [Character]

    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}
