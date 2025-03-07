//
//  PokemonModels.swift
//  Pokedex
//
//  Created by Kinzo on 3/5/25.
//

import Foundation

struct PokemonPage : Codable{
    let count: Int
    let next: String
    let results: [PokemonModel]
}

struct PokemonModel : Codable , Identifiable, Equatable{
    let id = UUID()
    let name: String
    let url: String
    
    static var sample : PokemonModel = PokemonModel(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/")
}

struct PokemonDetailModel : Codable{
    let id: Int
    let height : Int
    let weight : Int
}
