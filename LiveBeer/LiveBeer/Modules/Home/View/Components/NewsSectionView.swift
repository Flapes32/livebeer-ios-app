import SwiftUI
import UIKit

struct NewsSectionView: View {
    let newsItems: [NewsItem]
    let onNewsTap: (NewsItem) -> Void
    
    @State private var currentIndex: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.sm) {
            HStack(spacing: AppSpacing.xs) {
                Text("Будь в курсе")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(AppColors.dark)

                Spacer()

                Button(action: scrollToNext) {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(AppColors.dark)
                }
            }

            GeometryReader { geometry in
                let screenWidth = UIScreen.main.bounds.width
                let horizontalPadding: CGFloat = AppSpacing.md * 2
                let availableWidth = screenWidth - horizontalPadding
                let spacing: CGFloat = 4
                let cardWidth = (availableWidth - spacing) / 2
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: spacing) {
                            ForEach(Array(newsItems.enumerated()), id: \.element.id) { index, item in
                                NewsCardView(newsItem: item) {
                                    onNewsTap(item)
                                }
                                .frame(width: cardWidth)
                                .id(index)
                            }
                        }
                    }
                    .onChange(of: currentIndex) { newIndex in
                        withAnimation(.easeInOut(duration: 0.3)) {
                            proxy.scrollTo(newIndex, anchor: .leading)
                        }
                    }
                }
            }
            .frame(height: 140)
        }
    }
    
    private func scrollToNext() {
        // Прокручиваем на одну карточку вправо (так как видно 2 карточки, увеличиваем индекс на 1)
        if currentIndex < newsItems.count - 1 {
            currentIndex = min(currentIndex + 1, newsItems.count - 1)
        }
    }
}

#Preview {
    NewsSectionView(newsItems: NewsItem.mockItems, onNewsTap: { _ in })
        .background(AppColors.background)
}
