import Foundation

struct HeroService {
    
    func fetchRandomHero() async throws -> Hero {
        let randomId = Int.random(in: 1...731)
        let url = URL(string: "https://akabab.github.io/superhero-api/api/id/\(randomId).json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let hero = try JSONDecoder().decode(Hero.self, from: data)
        return hero
    }
}
