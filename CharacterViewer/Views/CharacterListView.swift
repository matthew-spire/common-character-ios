//
//  ContentView.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import SwiftUI

// Define the CharacterListView struct, which conforms to the View protocol.
struct CharacterListView: View {
    // Create a @StateObject to manage the CharacterListViewModel instance.
    @StateObject private var viewModel = CharacterListViewModel()

    // Define the body property, which is a computed property that returns a view hierarchy.
    var body: some View {
        // Create a NavigationView to display the List within a navigational context.
        NavigationView {
            // Create a List that displays the characters in the viewModel.
            List(viewModel.characters) { character in
                // For each character, display a CharacterRow view.
                CharacterRow(character: character)
            }
            // Set the navigation title for the List.
            .navigationTitle("Characters")
        }
    }
}

// Define the CharacterListView_Previews struct, which conforms to the PreviewProvider protocol.
struct CharacterListView_Previews: PreviewProvider {
    // Define the previews property, which is a computed property that returns a view hierarchy for the Xcode preview.
    static var previews: some View {
        // Return a CharacterListView instance for the Xcode preview.
        CharacterListView()
    }
}
