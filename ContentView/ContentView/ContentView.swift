import SwiftUI

struct ContentView: View {
    
    let itemNames = ["Minecraft", "The Witcher 3", "Celeste", "Dark Souls", "Stardew Valley", "Portal 2"]
    let itemIcons = ["cube.fill", "shield.fill", "mountain.2.fill", "flame.fill", "leaf.fill", "arrow.up.circle.fill"]
    let itemDescriptions = [
        "Игра про бесконечное строительство и выживание в мире из кубиков. Можно строить всё что угодно.",
        "Огромный RPG с ведьмаком Геральтом. Лучший открытый мир по мнению многих игроков.",
        "Платформер о девушке, которая покоряет гору. Очень сложно, но очень честно.",
        "Тяжёлая игра про рыцаря в мрачном мире. Умрёшь сотни раз — и всё равно будешь играть.",
        "Симулятор фермы где можно выращивать репу и дружить с соседями. Очень расслабляет.",
        "Головоломки с порталами и злобный ИИ GLaDOS. Шедевр жанра."
    ]
    let itemRatings = [2, 4, 5, 5, 1, 3]
    
    @State private var currentIndex = 0
    @State private var tapCount = 0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Image(systemName: itemIcons[currentIndex])
                .font(.system(size: 80))
                .foregroundColor(.blue)
            
            Text(itemNames[currentIndex])
                .font(.title)
                .bold()
            
            Divider()
                .padding(.horizontal)
            
            Text(itemDescriptions[currentIndex])
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            let rating = itemRatings[currentIndex]
            if rating == 0 {
                Text("Без оценки")
                    .foregroundStyle(.secondary)
            } else {
                Text("Сложность: " + String(repeating: "💀", count: rating))
            }
            
            Button("Surprise Me!") {
                var newIndex: Int
                repeat {
                    newIndex = Int.random(in: 0..<itemNames.count)
                } while newIndex == currentIndex
                currentIndex = newIndex
                tapCount += 1
            }
            .buttonStyle(.borderedProminent)
            
            Text("Cards explored: \(tapCount)")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Spacer()
        }
        .padding()
    }
}
