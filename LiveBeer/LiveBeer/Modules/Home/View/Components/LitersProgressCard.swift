import SwiftUI

struct LitersProgressCard: View {
    let currentLiters: Double
    let targetLiters: Double

    private var litersValue: String {
        "\(Int(currentLiters))/\(Int(targetLiters))"
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: AppRadius.lg, style: .continuous)
                .fill(Color.black)

            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                HStack(alignment: .top, spacing: AppSpacing.xs) {
                    Image("крышки")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 230, height: 100, alignment: .leading)

                    Spacer(minLength: 0)

                    Image("бонус")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 96, height: 100)
                }

                HStack(alignment: .top, spacing: AppSpacing.sm) {
                    VStack(alignment: .leading, spacing: AppSpacing.xxs) {
                        Text(litersValue)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundStyle(AppColors.surface)

                        Text("Накоплено литров")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(AppColors.surface)
                    }

                    Rectangle()
                        .fill(AppColors.gray.opacity(0.4))
                        .frame(width: 1, height: 50)
                        .offset(y: 12)

                    Text("Копите литры\nи получайте пиво\nбесплатно")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(AppColors.gray)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, AppSpacing.sm)
                        .offset(y: 10)
                }
            }
            .padding(AppSpacing.md)
        }
        .frame(height: 132)
    }
}

#Preview {
    LitersProgressCard(currentLiters: 10, targetLiters: 10)
        .padding()
        .background(AppColors.background)
}
