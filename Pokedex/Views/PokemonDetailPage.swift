//
//  PokemonDetailPage.swift
//  Pokedex
//
//  Created by Kinzo on 3/5/25.
//

import SwiftUI

struct PokemonDetailPage: View {
    @EnvironmentObject var viewModel : PokemonViewModel
    var pokemon : PokemonModel
    var body: some View {
        VStack{
            PokemonImageView(pokemon: pokemon)
            Text("**ID**: \(viewModel.detailPokemon?.id ?? 0)")
            Text("**ID**: \(viewModel.detailPokemon?.weight ?? 0) Kg")
            Text("**ID**: \(viewModel.detailPokemon?.height ?? 0) M")
        }.onAppear{
            viewModel.getPokemonDetail(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonDetailPage(pokemon: PokemonModel.sample)
}
