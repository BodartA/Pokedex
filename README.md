# 🧢 Pokedex

![Swift](https://img.shields.io/badge/Swift-5.9-orange?logo=swift)
![SwiftUI](https://img.shields.io/badge/SwiftUI-%20-blue?logo=swift)
![iOS](https://img.shields.io/badge/iOS-17-lightgrey?logo=apple)
![License](https://img.shields.io/badge/License-MIT-green)

## 📌 Overview

**Pokedex** is a **simple, responsive Pokémon browser built with SwiftUI**, designed to:

✅ Practice `MVVM` architecture separation  
✅ Manipulate API calls with `URLSession` and JSON decoding  
✅ Use `LazyVGrid`, responsive layouts, and image loading with `SDWebImageSwiftUI`  
✅ Explore search integration with SwiftUI's `.searchable` and Unicode-safe filtering

---

## 🎯 Purpose

This project was kept intentionally minimal in both **technical complexity** and **UI design**.

Its goals:

- Reinforce SwiftUI concepts in a real-world API scenario  
- Practice proper separation of concerns with `Model`, `View`, and `ViewModel`  
- Load and decode external JSON data via `Codable` and `URLSession`  
- Explore dynamic layout with `LazyVGrid` and `adaptive GridItem`  
- Use `SDWebImageSwiftUI` to improve image loading over `AsyncImage`  
- Integrate Unicode- and accent-insensitive search behavior with `.searchable`

---

## ✨ Features

✅ Fetch and decode Pokémon from a public API (`https://pokebuildapi.fr/api/v1/pokemon`)  
✅ Display them in a clean, responsive grid layout  
✅ Load and cache sprite images asynchronously  
✅ Use a search bar to filter Pokémon by name, even without accents  
✅ Simple, scrollable, responsive UI that works across screen sizes

---

## 🤔 Why This Project?

> **“I built Pokédex as a focused learning exercise to strengthen my SwiftUI foundations — especially around MVVM, networking, and basic UI layout. I chose not to over-engineer or add complex details like a full detail view to stay focused.”**

If you're looking for:

✅ A clean MVVM example  
✅ Real API integration (with decoding)  
✅ Lazy grid layout with image handling  
✅ Accent-insensitive search with SwiftUI

Then this project offers a **concise and real-world use case to learn from**.

---

## 🖼️ Screenshots

### 🏠 Pokedex Grid View
<img src="https://github.com/TON_PROFIL/PokedexApp/blob/main/Screenshots/PokedexGrid.png" width="300">

### 🔍 Search in Action
<img src="https://github.com/TON_PROFIL/PokedexApp/blob/main/Screenshots/PokedexSearch.png" width="300">

### ❌ No Match Found
<img src="https://github.com/TON_PROFIL/PokedexApp/blob/main/Screenshots/PokedexEmptyState.png" width="300">

---

## 🛠️ Tech Stack

- **Swift 5.9**
- **SwiftUI**
- **MVVM Architecture**
- **URLSession + Codable**
- **SDWebImageSwiftUI**
- Designed for **iOS 17+**

---

## ⚠️ Notes

- This app **does not include navigation to detail views** (on purpose)
- No CoreData or persistence used — the focus is on networking + layout
- Built as a **learning sandbox**, not a production-ready Pokédex
- The UI and logic are kept **intentionally simple** for clarity and learning

---

> Next step: I'm moving on to a more ambitious and practical SwiftUI app to apply everything learned here in a meaningful project 💪
