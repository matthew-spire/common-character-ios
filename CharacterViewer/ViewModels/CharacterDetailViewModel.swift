//
//  CharacterDetailViewModel.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import Foundation

// CharacterDetailViewModel is an ObservableObject, which allows SwiftUI views to observe and react to changes in its properties.
class CharacterDetailViewModel: ObservableObject {
    // The character property holds the Character object to be displayed in the detail view.
    @Published var character: Character

    // The initializer takes a Character object and sets it as the value of the character property.
    init(character: Character) {
        self.character = character
    }
}
