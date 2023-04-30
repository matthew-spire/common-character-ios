//
//  CharacterRepository.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import Foundation
import Combine

// Class responsible for interacting with the CharacterAPI to fetch character data.
class CharacterRepository {
    // A reference to an object that conforms to the CharacterAPI protocol.
    private let characterAPI: CharacterAPI

    // Initializes the CharacterRepository with an object conforming to the CharacterAPI protocol.
    init(characterAPI: CharacterAPI) {
        self.characterAPI = characterAPI
    }

    // Function that fetches characters using the CharacterAPI instance.
    func fetchCharacters(query: String) -> AnyPublisher<[Character], Error> {
        // Call the fetchCharacters function on the characterAPI instance and pass the query parameter.
        characterAPI.fetchCharacters(query: query)
    }
}
