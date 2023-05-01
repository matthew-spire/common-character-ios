//
//  CharacterListViewModel.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import Foundation
import Combine

// Define the CharacterListViewModel class, which conforms to the ObservableObject protocol. This allows SwiftUI views to observe changes in this ViewModel.
class CharacterListViewModel: ObservableObject {
    // A published property that holds an array of Character models, allowing the View to observe and react to changes.
    @Published private(set) var characters: [Character] = []
    // A reference to the CharacterRepository, which is responsible for fetching character data from the API.
    private let characterRepository: CharacterRepository
    // A set of any cancellable objects used to store and manage Combine subscriptions.
    private var cancellables = Set<AnyCancellable>()

    // The initializer that takes an optional CharacterRepository instance and initializes the ViewModel with it.
    // Also calls the `fetchCharacters` function to fetch the initial data.
    init(characterRepository: CharacterRepository = CharacterRepository(characterAPI: CharacterAPIImplementation())) {
        self.characterRepository = characterRepository
        fetchCharacters(query: "the+wire+characters")
    }

    // A function that fetches character data from the CharacterRepository using the provided query, then updates the `characters` property when new data is received.
    private func fetchCharacters(query: String) {
        // Call the fetchCharacters method on the CharacterRepository with the provided query.
        characterRepository.fetchCharacters(query: query)
            // Ensure that any updates to the published properties are performed on the main thread.
            .receive(on: DispatchQueue.main)
            // Create a sink subscriber with a completion and a value handler.
            .sink(
                // Handle the completion event, which can be ignored in this case.
                receiveCompletion: { _ in },
                // Handle the value event, which updates the characters property with the new data.
                receiveValue: { characters in self.characters = characters })
            // Store the subscription in the cancellables set to manage its lifecycle.
            .store(in: &cancellables)
    }
}
