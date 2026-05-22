import Foundation

@MainActor
class HeroViewModel: ObservableObject {
    
    @Published var hero: Hero?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service = HeroService()
    
    func loadRandomHero() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let result = try await service.fetchRandomHero()
                hero = result
            } catch {
                errorMessage = "Не удалось загрузить героя. Проверь интернет."
            }
            isLoading = false
        }
    }
}
