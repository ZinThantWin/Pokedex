//
//  PokemonListPage.swift
//  Pokedex
//
//  Created by Kinzo on 3/5/25.
//

import SwiftUI

struct PokemonListPage: View {
    @StateObject var viewModel = PokemonViewModel()
    private var adaptiveColumns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: adaptiveColumns) {
                    ForEach (viewModel.filteredPokemons){pokemon in
                        NavigationLink {
                            PokemonDetailPage(pokemon: pokemon)
                        } label: {
                            PokemonImageView(pokemon: pokemon)
                        }

                    }
                }
            }
            .animation(.easeIn(duration: 0.3), value: viewModel.searchText)
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Pokedex")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    PokemonListPage()
}
