//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Antoine BODART on 31/07/2025.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    func fetchPokemon() {
        
        guard let url = URL(string: "https://pokebuildapi.fr/api/v1/pokemon") else {
            print("URL unavailable")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, res, error in
        
            if let error = error {
                print("Network error: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode([Pokemon].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.pokemons = decoded
                    }
                    
                } catch {
                    print("Parsing error : \(error)")
                }
                
            } else {
                print("No data")
                return
            }
        }
        .resume()
    }
}
