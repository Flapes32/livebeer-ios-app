import Foundation

struct LoyaltyInfo: Codable {
    let currentPoints: Int
    let totalPoints: Int
    let level: LoyaltyLevel
    let nextLevelPoints: Int
    let availableBonuses: [Bonus]
}

enum LoyaltyLevel: String, Codable {
    case bronze = "Бронза"
    case silver = "Серебро"
    case gold = "Золото"
    case platinum = "Платина"
}

struct Bonus: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let pointsRequired: Int
    let isAvailable: Bool
}

extension LoyaltyInfo {
    static let mock = LoyaltyInfo(
        currentPoints: 1250,
        totalPoints: 5000,
        level: .silver,
        nextLevelPoints: 2000,
        availableBonuses: [
            Bonus(
                id: "bonus_001",
                title: "Скидка 10%",
                description: "На все напитки",
                pointsRequired: 500,
                isAvailable: true
            ),
            Bonus(
                id: "bonus_002",
                title: "Бесплатная пинта",
                description: "Любое пиво на выбор",
                pointsRequired: 1000,
                isAvailable: true
            ),
            Bonus(
                id: "bonus_003",
                title: "VIP статус",
                description: "Приоритетная бронь столика",
                pointsRequired: 3000,
                isAvailable: false
            )
        ]
    )
}
