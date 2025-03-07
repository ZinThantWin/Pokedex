//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Kinzo on 3/5/25.
//

import Foundation

class PokemonManager {
    func getPokemons() -> [PokemonModel] {
        let data : PokemonPage = Bundle.main.decode(file: "Pokemon.json")
        return data.results
    }
    
    func getPokemonDatail(id: Int, _ completion:@escaping(PokemonDetailModel) -> ()){
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: PokemonDetailModel.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
