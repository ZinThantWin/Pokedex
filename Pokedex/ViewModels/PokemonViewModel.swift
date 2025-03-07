//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Kinzo on 3/5/25.
//

import Foundation

final class PokemonViewModel : ObservableObject {
    private let pokemonManager = PokemonManager()
    @Published var pokemons = [PokemonModel]()
    @Published var detailPokemon: PokemonDetailModel?
    @Published var searchText: String = ""
    
    init(){
        self.pokemons = pokemonManager.getPokemons()
    }
    
    func getPokemonIndex(pokemon: PokemonModel) -> Int {
        let index = self.pokemons.firstIndex(of: pokemon) ?? 1;
        return index + 1;
    }
    
    func getPokemonDetail(pokemon : PokemonModel){
        let index = self.getPokemonIndex(pokemon: pokemon)
        pokemonManager.getPokemonDatail(id: index) { detail in
            print(detail)
            DispatchQueue.main.async {
                self.detailPokemon = detail
            }
        }
    }
}
