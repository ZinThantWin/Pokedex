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
    @Published var filteredPokemons = [PokemonModel]()
    @Published var detailPokemon: PokemonDetailModel?
    @Published var searchText: String = "" {
        didSet{
            filterPokemons()
        }
    }
    
    init(){
        self.pokemons = pokemonManager.getPokemons()
        filterPokemons()
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
    
    func filterPokemons(){
        
        if pokemons.isEmpty{
            return
        }
        
        if searchText.isEmpty{
            filteredPokemons = pokemons
        }else{
            filteredPokemons = pokemons.filter({ pokemon in
                pokemon.name.lowercased().contains(searchText.lowercased())
            })
        }
        
        
    }
}
