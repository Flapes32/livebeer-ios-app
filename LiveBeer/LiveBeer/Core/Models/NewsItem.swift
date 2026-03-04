import Foundation

struct NewsItem: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let imageURL: String?
    let publishedDate: Date
    let category: NewsCategory
}

enum NewsCategory: String, Codable {
    case event = "События"
    case promotion = "Акции"
    case news = "Новости"
    case beer = "Пиво"
}

extension NewsItem {
    static let mockItems: [NewsItem] = [
        NewsItem(
            id: "news_001",
            title: "Новое крафтовое пиво в меню",
            description: "Попробуйте наш новый IPA с цитрусовыми нотами",
            imageURL: nil,
            publishedDate: Date(),
            category: .beer
        ),
        NewsItem(
            id: "news_002",
            title: "Живая музыка каждую пятницу",
            description: "Приходите на концерты местных групп",
            imageURL: nil,
            publishedDate: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(),
            category: .event
        ),
        NewsItem(
            id: "news_003",
            title: "Скидка 20% на все закуски",
            description: "Действует до конца недели",
            imageURL: nil,
            publishedDate: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(),
            category: .promotion
        ),
        NewsItem(
            id: "news_004",
            title: "Открытие новой террасы",
            description: "Теперь можно наслаждаться пивом на свежем воздухе",
            imageURL: nil,
            publishedDate: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date(),
            category: .news
        )
    ]
}
