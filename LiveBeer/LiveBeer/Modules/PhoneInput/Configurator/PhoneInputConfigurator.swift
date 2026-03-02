import SwiftUI

struct PhoneInputConfigurator {
    private let demoPhoneDigits = "79132109582"

    @MainActor
    func make(
        onBack: @escaping () -> Void,
        onSuccess: @escaping () -> Void
    ) -> PhoneInputView {
        let formatter = PhoneFormatterService()
        let authService = AuthServiceMock(
            scenario: .success,
            acceptedPhoneDigits: demoPhoneDigits
        )
        let viewModel = PhoneInputViewModel(
            formatter: formatter,
            authService: authService,
            onBack: onBack,
            onSuccess: onSuccess,
            onRegistration: onSuccess
        )

        return PhoneInputView(viewModel: viewModel)
    }
}
