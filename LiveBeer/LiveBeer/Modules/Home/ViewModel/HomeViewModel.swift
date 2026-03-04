import Foundation

final class HomeViewModel: ObservableObject {
    // MARK: - Properties

    @Published var selectedTab: Int = 0
    
    private weak var output: HomeOutput?

    // MARK: - Init

    init(output: HomeOutput?) {
        self.output = output
    }

    // MARK: - Internal Methods

    func didSelectTab(_ tabIndex: Int) {
        selectedTab = tabIndex
        output?.homeDidSelectTab(tabIndex)
    }

    func didTapNews(_ newsItem: NewsItem) {
        output?.homeDidTapNews(newsItem)
    }
}
