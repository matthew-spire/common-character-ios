//
//  CharacterRow.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import SwiftUI

// Define a struct named CharacterRow that conforms to the View protocol.
struct CharacterRow: View {
    // Holds a reference to a Character object that will be displayed in the row.
    let character: Character

    var body: some View {
        // Extract the character's name from the `text` property.
        let characterName = character.text.components(separatedBy: " - ").first ?? ""

        // Create a navigation link that navigates to the character detail view when the row is tapped.
        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
            // The HStack contains a Text view displaying the character's name.
            HStack {
                Text(characterName)
            }
        }
    }
}
