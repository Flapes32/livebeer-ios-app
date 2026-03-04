import Foundation

struct User: Identifiable, Codable {
    let id: String
    let name: String
    let phone: String
    let email: String?
    let avatarURL: String?
    let registrationDate: Date
}

extension User {
    static let mock = User(
        id: "user_001",
        name: "Иван Иванов",
        phone: "+7 (913) 210 95 82",
        email: "ivan@example.com",
        avatarURL: nil,
        registrationDate: Date()
    )
}
