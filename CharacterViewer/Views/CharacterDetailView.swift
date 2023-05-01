//
//  CharacterDetailView.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import SwiftUI

// Define a struct named CharacterDetailView that conforms to the View protocol.
struct CharacterDetailView: View {
    // Declare an @ObservedObject property named viewModel of type CharacterDetailViewModel.
    @ObservedObject var viewModel: CharacterDetailViewModel
    // Declare a constant baseUrl for constructing the full icon URL.
    private let baseUrl = "https://duckduckgo.com"

    // Define the body property as a computed property.
    var body: some View {
        // Extract the character's name from the `text` property.
        let characterName = viewModel.character.text.components(separatedBy: " - ").first ?? ""
        // Construct the full icon URL using the `iconURL` property and `baseUrl`.
        let iconUrl = viewModel.character.iconURL.flatMap { URL(string: baseUrl + $0) }

        // VStack containing the character's image, name, and description.
        VStack {
            // AsyncImage for loading the remote image, with a progress view as a placeholder.
            AsyncImage(url: iconUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            // Text view for the character's name.
            Text(characterName)
                .font(.title)
                .padding(.top)
            // Text view for the character's description.
            Text(viewModel.character.text)
                .font(.body)
                .padding(.top)
            // Spacer to push the VStack's contents to the top of the view.
            Spacer()
        }
        // Apply padding to the VStack.
        .padding()
        // Set the navigation bar title to the character's name.
        .navigationBarTitle(characterName, displayMode: .inline)
    }
}
