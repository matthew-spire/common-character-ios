//
//  CharacterDetailViewModel.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var character: Character

    init(character: Character) {
        self.character = character
    }
}
