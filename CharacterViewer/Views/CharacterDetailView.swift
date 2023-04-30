//
//  CharacterDetailView.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var viewModel: CharacterDetailViewModel
    private let baseUrl = "https://duckduckgo.com"

    var body: some View {
        let characterName = viewModel.character.text.components(separatedBy: " - ").first ?? ""
        let iconUrl = viewModel.character.iconURL.flatMap { URL(string: baseUrl + $0) }

        VStack {
            AsyncImage(url: iconUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                // Placeholder image view here
            }
            Text(characterName)
                .font(.title)
                .padding(.top)
            Text(viewModel.character.text)
                .font(.body)
                .padding(.top)
            Spacer()
        }
        .padding()
        .navigationBarTitle(characterName, displayMode: .inline)
    }
}
