import SwiftUI

struct PhoneInputConfigurator {
    private let demoPhoneDigits = "79132109582"

    @MainActor
    func make(output: PhoneInputOutput?) -> PhoneInputView {
        let formatter = PhoneFormatterService()
        let authService = AuthServiceMock(
            scenario: .success,
            acceptedPhoneDigits: demoPhoneDigits
        )
        let viewModel = PhoneInputViewModel(
            formatter: formatter,
            authService: authService,
            output: output
        )

        return PhoneInputView(viewModel: viewModel)
    }
}
