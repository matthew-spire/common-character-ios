//
//  CharacterAPI.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

// Import the Foundation and Combine frameworks to use the necessary types and APIs.
import Foundation
import Combine

// Define the CharacterAPI protocol, which is used to fetch character data.
protocol CharacterAPI {
    // Define the fetchCharacters function, which returns a publisher emitting an array of Characters.
    func fetchCharacters(query: String) -> AnyPublisher<[Character], Error>
}
