import SwiftUI
import UIKit

struct NewsSectionView: View {
    let newsItems: [NewsItem]
    let onNewsTap: (NewsItem) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.sm) {
            HStack(spacing: AppSpacing.xs) {
                Text("Будь в курсе")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(AppColors.dark)

                Spacer()

                Image(systemName: "arrow.right")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(AppColors.dark)
            }

            GeometryReader { geometry in
                let screenWidth = UIScreen.main.bounds.width
                let horizontalPadding: CGFloat = AppSpacing.md * 2
                let availableWidth = screenWidth - horizontalPadding
                let spacing: CGFloat = 4
                let cardWidth = (availableWidth - spacing) / 2
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: spacing) {
                        ForEach(newsItems) { item in
                            NewsCardView(newsItem: item) {
                                onNewsTap(item)
                            }
                            .frame(width: cardWidth)
                        }
                    }
                }
            }
            .frame(height: 140)
        }
    }
}

#Preview {
    NewsSectionView(newsItems: NewsItem.mockItems, onNewsTap: { _ in })
        .background(AppColors.background)
}
