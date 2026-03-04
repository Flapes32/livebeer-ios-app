import SwiftUI

struct StoresView: View {
    // MARK: - Properties

    @ObservedObject private var viewModel: StoresViewModel

    // MARK: - Init

    init(viewModel: StoresViewModel, selectedTab: Binding<Int>) {
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
            
            Image(systemName: "cart.fill")
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
    }
}

#Preview {
    StoresConfigurator.make(output: nil, selectedTab: .constant(2))
}
