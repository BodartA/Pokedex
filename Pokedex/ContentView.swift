//
//  ContentView.swift
//  Pokedex
//
//  Created by Antoine BODART on 28/07/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        ScrollView {
                    LazyVStack(spacing: 12, pinnedViews: []) {
                        ForEach(viewModel.pokemons) { pokemon in
                            HStack(spacing: 16) {
                                AsyncImage(url: URL(string: pokemon.image)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 60, height: 60)
                                }
                                
                                Text(pokemon.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
        .onAppear {
            viewModel.fetchPokemon()
        }
    }
}

#Preview {
    ContentView()
}
