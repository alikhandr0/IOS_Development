import SwiftUI

// MARK: - Model

struct FavoriteItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let emoji: String
}

// MARK: - Main View

struct ContentView: View {
    
    @State private var rpgGames: [FavoriteItem] = [
        FavoriteItem(title: "The Witcher 3", subtitle: "CD Projekt Red, 2015", emoji: "⚔️"),
        FavoriteItem(title: "Elden Ring", subtitle: "FromSoftware, 2022", emoji: "💀"),
        FavoriteItem(title: "Baldur's Gate 3", subtitle: "Larian Studios, 2023", emoji: "🎲"),
        FavoriteItem(title: "Dark Souls", subtitle: "FromSoftware, 2011", emoji: "🔥"),
        FavoriteItem(title: "Skyrim", subtitle: "Bethesda, 2011", emoji: "🐉"),
        FavoriteItem(title: "Mass Effect 2", subtitle: "BioWare, 2010", emoji: "🚀"),
        FavoriteItem(title: "Divinity: Original Sin 2", subtitle: "Larian Studios, 2017", emoji: "🧙"),
        FavoriteItem(title: "Dragon Age: Origins", subtitle: "BioWare, 2009", emoji: "🗡️"),
        FavoriteItem(title: "Persona 5", subtitle: "Atlus, 2016", emoji: "🃏"),
        FavoriteItem(title: "Final Fantasy VII", subtitle: "Square, 1997", emoji: "🌟")
    ]
    
    @State private var indieGames: [FavoriteItem] = [
        FavoriteItem(title: "Hollow Knight", subtitle: "Team Cherry, 2017", emoji: "🦋"),
        FavoriteItem(title: "Celeste", subtitle: "Maddy Thorson, 2018", emoji: "🏔️"),
        FavoriteItem(title: "Hades", subtitle: "Supergiant Games, 2020", emoji: "⚡"),
        FavoriteItem(title: "Stardew Valley", subtitle: "ConcernedApe, 2016", emoji: "🌾"),
        FavoriteItem(title: "Undertale", subtitle: "Toby Fox, 2015", emoji: "❤️"),
        FavoriteItem(title: "Disco Elysium", subtitle: "ZA/UM, 2019", emoji: "🥃"),
        FavoriteItem(title: "Into the Breach", subtitle: "Subset Games, 2018", emoji: "🤖"),
        FavoriteItem(title: "Outer Wilds", subtitle: "Mobius Digital, 2019", emoji: "🌌"),
        FavoriteItem(title: "Dead Cells", subtitle: "Motion Twin, 2018", emoji: "🗺️"),
        FavoriteItem(title: "Shovel Knight", subtitle: "Yacht Club Games, 2014", emoji: "🪣")
    ]
    
    @State private var shooters: [FavoriteItem] = [
        FavoriteItem(title: "Half-Life 2", subtitle: "Valve, 2004", emoji: "🔫"),
        FavoriteItem(title: "Doom Eternal", subtitle: "id Software, 2020", emoji: "😈"),
        FavoriteItem(title: "Portal 2", subtitle: "Valve, 2011", emoji: "🌀"),
        FavoriteItem(title: "Titanfall 2", subtitle: "Respawn, 2016", emoji: "🦾"),
        FavoriteItem(title: "Bioshock Infinite", subtitle: "Irrational Games, 2013", emoji: "🎡"),
        FavoriteItem(title: "Metro 2033", subtitle: "4A Games, 2010", emoji: "☢️"),
        FavoriteItem(title: "Counter-Strike 2", subtitle: "Valve, 2023", emoji: "💣"),
        FavoriteItem(title: "Superhot", subtitle: "Superhot Team, 2016", emoji: "🧊"),
        FavoriteItem(title: "Prey", subtitle: "Arkane Studios, 2017", emoji: "🔬"),
        FavoriteItem(title: "Quake", subtitle: "id Software, 1996", emoji: "⚡")
    ]
    
    @State private var strategy: [FavoriteItem] = [
        FavoriteItem(title: "Civilization VI", subtitle: "Firaxis, 2016", emoji: "🏛️"),
        FavoriteItem(title: "StarCraft II", subtitle: "Blizzard, 2010", emoji: "👾"),
        FavoriteItem(title: "XCOM 2", subtitle: "Firaxis, 2016", emoji: "👽"),
        FavoriteItem(title: "Total War: Warhammer", subtitle: "CA, 2016", emoji: "🪖"),
        FavoriteItem(title: "Age of Empires II", subtitle: "Microsoft, 1999", emoji: "⚔️"),
        FavoriteItem(title: "Factorio", subtitle: "Wube Software, 2020", emoji: "🏭"),
        FavoriteItem(title: "Warcraft III", subtitle: "Blizzard, 2002", emoji: "🧝"),
        FavoriteItem(title: "Crusader Kings III", subtitle: "Paradox, 2020", emoji: "👑"),
        FavoriteItem(title: "Frostpunk", subtitle: "11 bit studios, 2018", emoji: "🥶"),
        FavoriteItem(title: "They Are Billions", subtitle: "Numantian Games, 2019", emoji: "🧟")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                
                // MARK: RPG
                Section("RPG") {
                    ForEach(rpgGames) { item in
                        ItemRow(item: item)
                    }
                }
                
                // MARK: Инди
                Section("Инди") {
                    ForEach(indieGames) { item in
                        ItemRow(item: item)
                    }
                }
                
                // MARK: Шутеры
                Section("Шутеры") {
                    ForEach(shooters) { item in
                        ItemRow(item: item)
                    }
                }
                
                // MARK: Стратегии
                Section("Стратегии") {
                    ForEach(strategy) { item in
                        ItemRow(item: item)
                    }
                }
            }
            .navigationTitle("Любимые игры")
        }
    }
}

// MARK: - Row View

struct ItemRow: View {
    let item: FavoriteItem
    
    var body: some View {
        HStack(spacing: 12) {
            Text(item.emoji)
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.body)
                Text(item.subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
