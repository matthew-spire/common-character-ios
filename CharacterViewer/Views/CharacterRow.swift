//
//  CharacterRow.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import SwiftUI

struct CharacterRow: View {
    let character: Character

    var body: some View {
        let characterName = character.text.components(separatedBy: " - ").first ?? ""
        
        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
            HStack {
                Text(characterName)
            }
        }
    }
}
