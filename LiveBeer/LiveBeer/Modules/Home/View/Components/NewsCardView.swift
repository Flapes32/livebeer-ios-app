import SwiftUI

struct NewsCardView: View {
    let newsItem: NewsItem
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text(newsItem.title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(AppColors.dark)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.horizontal, AppSpacing.sm)
                .padding(.vertical, AppSpacing.xs)
                .background(AppColors.yellow)
                .clipShape(RoundedRectangle(cornerRadius: AppRadius.sm, style: .continuous))
        }
        .buttonStyle(.plain)
        .frame(height: 120)
        .frame(maxWidth: 159)
    }
}

#Preview {
    NewsCardView(newsItem: NewsItem.mockItems[0], onTap: {})
        .padding()
        .background(AppColors.background)
}
