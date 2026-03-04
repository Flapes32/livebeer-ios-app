protocol HomeOutput: AnyObject {
    func homeDidSelectTab(_ tabIndex: Int)
    func homeDidTapNews(_ newsItem: NewsItem)
}
