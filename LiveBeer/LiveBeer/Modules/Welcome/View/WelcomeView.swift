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
        imageContentView
            .ignoresSafeArea()
    }


    // MARK: - Image Content

    private var imageContentView: some View {
        ZStack {
           backgroundView
            imageOverlay
        }
    }

    private var imageOverlay: some View {
        VStack {
            logoView
            .padding(.bottom, 65)
            foregroundView
            titleView
            buttonsView
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
            .frame(width: 517, height: 590)
    }
    
    private var logoView: some View {
        Image(Assets.Launch.logo.rawValue)
            .padding(.top, 86)
    }

    // MARK: - Foreground

    private var foregroundView: some View {
        Image(Assets.Launch.hands.rawValue)
            .resizable()
            .scaledToFill()
            .frame(width: 466, height: 270)
            .padding(.bottom, 140)
    }

    // MARK: - Title

    private var titleView: some View {
        Text("Программа\nлояльности для\nклиентов LiveBeer")
            .multilineTextAlignment(.center)
            .font(.system(size: 33, weight: .bold))
            .foregroundStyle(.black)
            .lineSpacing(4)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.horizontal, 25)
            .offset(y: -100)
            .padding(.bottom, 3)
    }


    // MARK: - Buttons

    private var buttonsView: some View {
        VStack(spacing: AppSpacing.md) {
            HStack(spacing: AppSpacing.sm) {
                PrimaryButton(
                    title: "Вход",
                    isEnabled: true,
                    isLoading: false,
                    action: viewModel.didTapLogin
                )
                .frame(maxWidth: .infinity)
                
                PrimaryButton(
                    title: "Регистрация",
                    isEnabled: true,
                    isLoading: false,
                    action: viewModel.didTapRegistration
                )
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: 350)
            
            SecondaryButton(
                title: "Войти без регистрации",
                isEnabled: true,
                action: viewModel.didTapGuest
            )
            .frame(maxWidth: 350)
        }
        .padding(.horizontal, AppSpacing.md)
        .offset(y: -90)
        .padding(.bottom, AppSpacing.xl)
    }
}

#Preview("iPhone 15") {
    WelcomeConfigurator.make(output: nil)
}

