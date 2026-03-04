import SwiftUI

struct InformationView: View {
    // MARK: - Properties

    @ObservedObject private var viewModel: InformationViewModel

    // MARK: - Init

    init(viewModel: InformationViewModel, selectedTab: Binding<Int>) {
        self.viewModel = viewModel
    }

    // MARK: - Views

    var body: some View {
        contentView
            .background(AppColors.background)
    }

    private var contentView: some View {
        VStack(spacing: AppSpacing.lg) {
            Spacer()
            
            Image(systemName: "info.circle.fill")
                .font(.system(size: 60))
                .foregroundStyle(AppColors.gray)
            
            Text("В разработке")
                .font(AppTypography.titleLarge)
                .foregroundStyle(AppColors.dark)
            
            Text("Этот раздел находится в разработке")
                .font(AppTypography.bodyPrimary)
                .foregroundStyle(AppColors.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, AppSpacing.xl)
            
            Spacer()
        }
        .transition(.opacity.combined(with: .scale(scale: 0.95)))
    }
}

#Preview {
    InformationConfigurator.make(output: nil, selectedTab: .constant(1))
}
