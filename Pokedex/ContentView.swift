//
//  ContentView.swift
//  Pokedex
//
//  Created by Antoine BODART on 28/07/2025.
//

import SwiftUI
import SDWebImageSwiftUI

extension String {
    var foldingForSearch: String {
        self.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
    }
}

struct ContentView: View {
    @StateObject private var viewModel = PokemonViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 16) {
                    
                    let filteredPokemons = viewModel.pokemons.filter {
                        searchText.isEmpty || $0.name.foldingForSearch.lowercased().contains(searchText.foldingForSearch.lowercased())
                    }
                    
                    if filteredPokemons.isEmpty {
                        VStack {
                                Spacer()

                                Text("No Pokémon found :(")
                                    .font(.headline)
                                    .foregroundColor(.secondary)

                                Spacer()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, 40) } else {
                            ForEach(filteredPokemons) { pokemon in
                                ZStack() {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.white)
                                        .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
                                    
                                    VStack(spacing: 8) {
                                        WebImage(url: URL(string: pokemon.sprite), ) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 80)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        Text(pokemon.name)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        
                                        Text("#\(pokemon.id)")
                                            .font(.subheadline)
                                            .foregroundColor(Color.gray)
                                    }
                                    .padding(.vertical, 8.0)
                                }
                            }
                            .padding(.horizontal, 4)
                        }
                }
                .padding(.all, 16)
            }
            .searchable(text: $searchText, prompt: "Pikachu ...")
            .onAppear {
                viewModel.fetchPokemon()
            }
        }
    }
}

#Preview {
    ContentView()
}
