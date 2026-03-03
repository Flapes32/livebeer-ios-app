import SwiftUI

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
            .padding(.horizontal, AppSpacing.md)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: AppSpacing.xs) {
                    ForEach(newsItems) { item in
                        NewsCardView(newsItem: item) {
                            onNewsTap(item)
                        }
                    }
                }
                .padding(.horizontal, AppSpacing.md)
            }
        }
    }
}

#Preview {
    NewsSectionView(newsItems: NewsItem.mockItems, onNewsTap: { _ in })
        .background(AppColors.background)
}
