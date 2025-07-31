//
//  PokemonEntry.swift
//  Pokedex
//
//  Created by Antoine BODART on 28/07/2025.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    
    let id: Int
    let name: String
    let image: String
}
