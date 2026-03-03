import SwiftUI

struct WelcomeView: View {
    // MARK: - Properties

    private let viewModel: WelcomeViewModel

    // MARK: - Init

    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Views

    var body: some View {
        content
            .ignoresSafeArea()
    }

    private var content: some View {
        VStack {
            imageContentView
            titleView
            buttonsView
        }
    }

    // MARK: - Image Content

    private var imageContentView: some View {
        ZStack {
            backgroundView
            foregroundView
        }
    }

    // MARK: - Background

    private var backgroundView: some View {
        VStack {
            backgroundImage
            Spacer()
        }
    }

    private var backgroundImage: some View {
        Image(Assets.Launch.background.rawValue)
            .resizable()
            .scaledToFill()
    }

    // MARK: - Foreground

    private var foregroundView: some View {
        VStack {
            foregroundTextView

        }
    }

    private var foregroundTextView: some View {
        VStack {
            Text("Live Beer")
            Text("Cупермаркет пива")
        }
    }

    private var foregroundImageView: some View {
        Image(Assets.Launch.hands.rawValue)

    }

    // MARK: - Title

    private var titleView: some View {
        Text("Программа лояльности для клиентов LiveBeer")
            .foregroundStyle(.black)
            .font(.largeTitle)
            .padding(.horizontal, 25)
            .padding(.bottom, 50)
    }


    // MARK: - Buttons

    private var buttonsView: some View {
        EmptyView()
    }

}

#Preview("iPhone 15") {
    WelcomeConfigurator.make(output: nil)
}

//    GeometryReader { proxy in
//        let heroHeight = max(390, proxy.size.height * 0.58)
//
//        VStack(spacing: 0) {
//            ZStack(alignment: .top) {
//                AppColors.background
//                Image("welcome_background")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//            }
//            .frame(maxWidth: .infinity)
//            .frame(height: heroHeight)
//
//            VStack(spacing: AppSpacing.md) {
//                Text("Программа\nлояльности для\nклиентов LiveBeer")
//                    .multilineTextAlignment(.center)
//                    .font(AppTypography.titleSmall)
//                    .foregroundStyle(AppColors.dark)
//                    .fixedSize(horizontal: false, vertical: true)
//                    .padding(.top, AppSpacing.lg)
//
//                HStack(spacing: AppSpacing.sm) {
//                    PrimaryButton(title: "Вход", isEnabled: true, isLoading: false, action: viewModel.didTapLogin)
//                    SecondaryButton(title: "Регистрация", isEnabled: true, action: viewModel.didTapRegistration)
//                }
//
//                TextLink(title: "Войти без регистрации", action: viewModel.didTapGuest)
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 48)
//                    .background(AppColors.surface)
//                    .overlay {
//                        RoundedRectangle(cornerRadius: AppRadius.md, style: .continuous)
//                            .stroke(AppColors.dark.opacity(0.12), lineWidth: 1)
//                    }
//                    .padding(.bottom, max(AppSpacing.md, proxy.safeAreaInsets.bottom))
//            }
//            .padding(.horizontal, AppSpacing.md)
//            .frame(maxWidth: .infinity)
//            .background(AppColors.surface)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//        .background(AppColors.surface)
//    }
//    .ignoresSafeArea(edges: .top)

enum Assets {
    enum Launch: String {
        case background = "Launch/background"
        case hands = "Launch/hands"
    }
}
