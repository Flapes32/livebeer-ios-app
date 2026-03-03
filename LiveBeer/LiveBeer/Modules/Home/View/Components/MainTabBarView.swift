import SwiftUI

struct MainTabBarView: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(
                title: "Главная",
                icon: "house.fill",
                isSelected: selectedTab == 0,
                action: { selectedTab = 0 }
            )
            TabBarButton(
                title: "Информация",
                icon: "info.circle.fill",
                isSelected: selectedTab == 1,
                action: { selectedTab = 1 }
            )
            TabBarButton(
                title: "Магазины",
                icon: "cart.fill",
                isSelected: selectedTab == 2,
                action: { selectedTab = 2 }
            )
            TabBarButton(
                title: "Профиль",
                icon: "person.fill",
                isSelected: selectedTab == 3,
                action: { selectedTab = 3 }
            )
        }
        .frame(height: 60)
        .background(Color.black)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(AppColors.gray.opacity(0.45)),
            alignment: .top
        )
    }
}

private struct TabBarButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: AppSpacing.xxs) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundStyle(isSelected ? AppColors.yellow : AppColors.gray)
                Text(title)
                    .font(AppTypography.caption)
                    .foregroundStyle(isSelected ? AppColors.yellow : AppColors.gray)
            }
            .padding(.vertical, AppSpacing.xxs)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: AppRadius.sm, style: .continuous)
                    .fill(isSelected ? AppColors.gray.opacity(0.22) : .clear)
            )
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    MainTabBarView(selectedTab: .constant(0))
        .background(AppColors.background)
}
