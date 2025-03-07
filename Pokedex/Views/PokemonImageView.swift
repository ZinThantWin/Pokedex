//
//  PokemonImageView.swift
//  Pokedex
//
//  Created by Kinzo on 3/5/25.
//

import SwiftUI

struct PokemonImageView: View {
    @EnvironmentObject var viewModel : PokemonViewModel
    let pokemon : PokemonModel
    let dimensions : Double = 140
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(viewModel.getPokemonIndex(pokemon: pokemon)).png")){phase in
                switch phase {
                case .empty:
                    ProgressView().frame(width: dimensions, height: dimensions)
                case .success(let image):
                    image.resizable().scaledToFit().frame(width: dimensions, height: dimensions)
                        .background(.thinMaterial).clipShape(.circle)
                case .failure(_):
                    Rectangle().fill(.black.gradient).frame(width: dimensions, height: dimensions).clipShape(.circle)
                @unknown default:
                    Rectangle().fill(.black.gradient).frame(width: dimensions, height: dimensions).clipShape(.circle)
                }
            }
            Text(pokemon.name).font(.system(size: 18, weight: .medium))
                .padding(.bottom,20)
        }
    }
}


