//
//  ContentView.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                CharacterRow(character: character)
            }
            .navigationTitle("Characters")
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
