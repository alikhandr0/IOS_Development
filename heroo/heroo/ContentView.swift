import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = HeroViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    if viewModel.isLoading {
                        ProgressView("Загружаем героя...")
                            .padding(.top, 100)
                        
                    } else if let message = viewModel.errorMessage {
                        Text(message)
                            .foregroundStyle(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                    } else if let hero = viewModel.hero {
                        HeroView(hero: hero)
                        
                    } else {
                        Text("Нажми кнопку чтобы загрузить героя")
                            .foregroundStyle(.secondary)
                            .padding(.top, 100)
                    }
                    
                    Button("Случайный герой") {
                        viewModel.loadRandomHero()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
                .padding()
            }
            .navigationTitle("HeroRandomizer")
        }
    }
}

// MARK: - Hero View

struct HeroView: View {
    let hero: Hero
    
    var body: some View {
        VStack(spacing: 12) {
            
            // Фото
            AsyncImage(url: URL(string: hero.images.lg)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } else if phase.error != nil {
                    Image(systemName: "person.fill")
                        .font(.system(size: 80))
                        .frame(height: 300)
                } else {
                    ProgressView()
                        .frame(height: 300)
                }
            }
            
            // Имя
            Text(hero.name)
                .font(.title)
                .bold()
            
            Text(hero.biography.fullName.isEmpty ? "—" : hero.biography.fullName)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Divider()
            
            // Паверстаты
            VStack(alignment: .leading, spacing: 8) {
                Text("Характеристики")
                    .font(.headline)
                
                StatRow(label: "Интеллект", value: hero.powerstats.intelligence)
                StatRow(label: "Сила", value: hero.powerstats.strength)
                StatRow(label: "Скорость", value: hero.powerstats.speed)
                StatRow(label: "Выносливость", value: hero.powerstats.durability)
                StatRow(label: "Сила способностей", value: hero.powerstats.power)
                StatRow(label: "Боевые навыки", value: hero.powerstats.combat)
            }
            
            Divider()
            
            // Биография и внешность
            VStack(alignment: .leading, spacing: 6) {
                Text("Инфо")
                    .font(.headline)
                
                InfoRow(label: "Издатель", value: hero.biography.publisher ?? "—")
                InfoRow(label: "Сторона", value: hero.biography.alignment)
                InfoRow(label: "Пол", value: hero.appearance.gender)
                InfoRow(label: "Раса", value: hero.appearance.race ?? "—")
                InfoRow(label: "Цвет глаз", value: hero.appearance.eyeColor)
                InfoRow(label: "Цвет волос", value: hero.appearance.hairColor)
                InfoRow(label: "Рост", value: hero.appearance.height.last ?? "—")
                InfoRow(label: "Вес", value: hero.appearance.weight.last ?? "—")
                InfoRow(label: "Профессия", value: hero.work.occupation)
                InfoRow(label: "Группа", value: hero.connections.groupAffiliation)
            }
        }
    }
}

// MARK: - Stat Row

struct StatRow: View {
    let label: String
    let value: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(label)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
                Text("\(value)")
                    .font(.caption)
                    .bold()
            }
            ProgressView(value: Double(value), total: 100)
        }
    }
}

// MARK: - Info Row

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(label + ":")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(width: 110, alignment: .leading)
            Text(value)
                .font(.caption)
            Spacer()
        }
    }
}

