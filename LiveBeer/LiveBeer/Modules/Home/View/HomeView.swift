import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: AppSpacing.md) {
                    headerBanner
                    
                    BarcodeView(barcodeString: "1234567010356443")
                    
                    LitersProgressCard(currentLiters: 10, targetLiters: 10)
                        .padding(.top, 30)
                    
                    PointsCard(loyaltyInfo: .mock)
                        .padding(.top, 30)
                    
                    NewsSectionView(newsItems: NewsItem.mockItems, onNewsTap: { _ in })
                }
                .padding(.horizontal, AppSpacing.md)
                .padding(.top, AppSpacing.md)
                .padding(.bottom, AppSpacing.xl)
            }

            MainTabBarView(selectedTab: $selectedTab)
        }
        .background(AppColors.background)
        .ignoresSafeArea(edges: .bottom)
    }

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
        .frame(height: 80)
    }
}

#Preview {
    HomeView()
}
