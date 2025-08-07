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
            let filteredPokemons = viewModel.pokemons.filter {
                searchText.isEmpty || $0.name.foldingForSearch.lowercased().contains(searchText.foldingForSearch.lowercased())
            }

            ZStack {
                if filteredPokemons.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "magnifyingglass.circle")
                            .font(.system(size: 48))
                            .foregroundColor(.gray)
                        
                        Text("No Pokemon found :(")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 16) {
                            ForEach(filteredPokemons) { pokemon in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.white)
                                        .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
                                    
                                    VStack(spacing: 8) {
                                        WebImage(url: URL(string: pokemon.sprite)) { image in
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
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.vertical, 8)
                                }
                            }
                            .padding(.horizontal, 4)
                        }
                        .padding(16)
                    }
                }
            }
            .navigationTitle("Pokedex")
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
