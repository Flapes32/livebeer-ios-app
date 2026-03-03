import SwiftUI

struct HomeView: View {
    // MARK: - Properties

    @State private var selectedTab: Int = 0

    // MARK: - Views

    var body: some View {
        VStack(spacing: 0) {
            scrollContentView
            MainTabBarView(selectedTab: $selectedTab)
        }
        .background(AppColors.background)
        .ignoresSafeArea(edges: .bottom)
    }

    // MARK: - Scroll Content

    private var scrollContentView: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: AppSpacing.lg) {
                headerBanner
                barcodeView
                litersProgressCard
                pointsCard
                newsSectionView
            }
            .padding(.horizontal, AppSpacing.md)
            .padding(.top, AppSpacing.md)
            .padding(.bottom, AppSpacing.xl)
        }
    }

    // MARK: - Header

    private var headerBanner: some View {
        ZStack {
            RoundedRectangle(cornerRadius: AppRadius.md, style: .continuous)
                .fill(AppColors.yellow)
            
            Image("фон для привествия")
                .resizable()
                .scaledToFill()
                .frame(height: 80)
                .clipped()
                .cornerRadius(AppRadius.md)
            
            VStack(spacing: 2) {
                Text("Привет, Дмитрий!")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(AppColors.dark)
                Text("Твой накопительный код")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(AppColors.dark)
            }
            .padding(.horizontal, AppSpacing.sm)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
    }

    // MARK: - Cards

    private var barcodeView: some View {
        BarcodeView(barcodeString: "1234567010356443")
            .frame(maxWidth: .infinity)
    }

    private var litersProgressCard: some View {
        LitersProgressCard(currentLiters: 10, targetLiters: 10)
            .frame(maxWidth: .infinity)
            .padding(.top, 40)
    }

    private var pointsCard: some View {
        PointsCard(loyaltyInfo: .mock)
            .frame(maxWidth: .infinity)
            .padding(.top, 40)
    }

    private var newsSectionView: some View {
        NewsSectionView(newsItems: NewsItem.mockItems, onNewsTap: { _ in })
            .frame(maxWidth: .infinity)
            .padding(.top, 40)
            .offset(y: -20)
    }
}

#Preview {
    HomeView()
}
