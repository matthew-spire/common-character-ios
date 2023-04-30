//
//  CharacterListViewModel.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import Foundation
import Combine

class CharacterListViewModel: ObservableObject {
    @Published private(set) var characters: [Character] = []
    private let characterAPI: CharacterAPI
    private var cancellables = Set<AnyCancellable>()

    init(characterAPI: CharacterAPI = CharacterAPIImplementation()) {
        self.characterAPI = characterAPI
        fetchCharacters(query: "the+wire+characters")
    }
    
    private func fetchCharacters(query: String) {
        characterAPI.fetchCharacters(query: query)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { characters in self.characters = characters })
            .store(in: &cancellables)
    }
}
