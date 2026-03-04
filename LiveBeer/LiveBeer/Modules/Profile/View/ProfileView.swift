import SwiftUI

struct ProfileView: View {
    // MARK: - Properties

    @ObservedObject private var viewModel: ProfileViewModel

    // MARK: - Init

    init(viewModel: ProfileViewModel, selectedTab: Binding<Int>) {
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
            
            Image(systemName: "person.fill")
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
    ProfileConfigurator.make(output: nil, selectedTab: .constant(3))
}
