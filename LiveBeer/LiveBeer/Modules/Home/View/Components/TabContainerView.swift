import SwiftUI

struct TabContainerView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Group {
            switch viewModel.selectedTab {
            case 0:
                homeContent
            case 1:
                InformationConfigurator.make(
                    output: nil,
                    selectedTab: Binding(
                        get: { viewModel.selectedTab },
                        set: { viewModel.didSelectTab($0) }
                    )
                )
            case 2:
                StoresConfigurator.make(
                    output: nil,
                    selectedTab: Binding(
                        get: { viewModel.selectedTab },
                        set: { viewModel.didSelectTab($0) }
                    )
                )
            case 3:
                ProfileConfigurator.make(
                    output: nil,
                    selectedTab: Binding(
                        get: { viewModel.selectedTab },
                        set: { viewModel.didSelectTab($0) }
                    )
                )
            default:
                homeContent
            }
        }
    }
    
    private var homeContent: some View {
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
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: AppRadius.md, style: .continuous)
                    .fill(AppColors.yellow)
                
                Image(Assets.Launch.background.rawValue)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 80)
                    .clipped()
                    .cornerRadius(AppRadius.md)
                
                VStack(spacing: 2) {
                    Text("Привет, Дмитрий!")
                        .font(.system(size: min(geometry.size.width * 0.067, 26), weight: .bold))
                        .foregroundStyle(AppColors.dark)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("Твой накопительный код")
                        .font(.system(size: min(geometry.size.width * 0.044, 17), weight: .regular))
                        .foregroundStyle(AppColors.dark)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, AppSpacing.sm)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
        }
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
        NewsSectionView(newsItems: NewsItem.mockItems, onNewsTap: viewModel.didTapNews)
            .frame(maxWidth: .infinity)
            .padding(.top, 40)
            .offset(y: -20)
    }
}
