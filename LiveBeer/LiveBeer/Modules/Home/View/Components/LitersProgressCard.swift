import SwiftUI

struct LitersProgressCard: View {
    // MARK: - Properties

    let currentLiters: Double
    let targetLiters: Double

    // MARK: - Views

    var body: some View {
        ZStack {
            backgroundCard
            contentView
        }
        .frame(height: 132)
    }

    // MARK: - Background

    private var backgroundCard: some View {
        RoundedRectangle(cornerRadius: AppRadius.lg, style: .continuous)
            .fill(Color.black)
    }

    // MARK: - Content

    private var contentView: some View {
        VStack(alignment: .leading, spacing: AppSpacing.sm) {
            imagesRow
            textRow
        }
        .padding(AppSpacing.md)
    }

    // MARK: - Images

    private var imagesRow: some View {
        HStack(alignment: .top, spacing: AppSpacing.xs) {
            stoppersGrid
            beerImage
        }
    }

    private var stoppersGrid: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                ForEach(0..<5, id: \.self) { _ in
                    stopperImage
                }
            }
            HStack(spacing: 4) {
                ForEach(0..<5, id: \.self) { _ in
                    stopperImage
                }
            }
        }
        .frame(width: 230, height: 80, alignment: .leading)
    }

    private var stopperImage: some View {
        Image(Assets2.LitersProgress.stopper.rawValue)
            .resizable()
            .scaledToFit()
            .frame(width: 45, height: 45)
    }

    private var beerImage: some View {
        Image(Assets2.LitersProgress.beer.rawValue)
            .resizable()
            .scaledToFill()
            .frame(width: 102, height: 95)
    }

    // MARK: - Text

    private var textRow: some View {
        HStack(alignment: .top, spacing: AppSpacing.sm) {
            litersInfoView
            dividerView
            descriptionView
        }
    }

    private var litersInfoView: some View {
        VStack(alignment: .leading, spacing: AppSpacing.xxs) {
            Text(litersValue)
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(AppColors.surface)

            Text("Накоплено литров")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(AppColors.surface)
        }
    }

    private var dividerView: some View {
        Rectangle()
            .fill(AppColors.gray.opacity(0.6))
            .frame(width: 1, height: 50)
            .padding(.top, 12)
    }

    private var descriptionView: some View {
        Text("Копите литры\nи получайте пиво\nбесплатно")
            .font(.system(size: 16, weight: .regular))
            .foregroundStyle(AppColors.gray)
            .multilineTextAlignment(.leading)
            .lineSpacing(1)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, AppSpacing.sm)
            .padding(.top, 10)
    }

    // MARK: - Computed Properties

    private var litersValue: String {
        "\(Int(currentLiters))/\(Int(targetLiters))"
    }
}

#Preview {
    LitersProgressCard(currentLiters: 10, targetLiters: 10)
        .padding()
        .background(AppColors.background)
}

enum Assets2 {
    enum LitersProgress: String {
        case stopper = "Litters/stopper"
        case beer = "Litters/beer"
    }
}
