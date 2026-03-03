import SwiftUI

@MainActor
struct ActivationCodeConfigurator {
    func make(
        phone: String,
        expectedCode: String = "1111",
        output: ActivationCodeOutput?
    ) -> ActivationCodeView {
        let viewModel = ActivationCodeViewModel(
            expectedCode: expectedCode,
            output: output
        )
        
        return ActivationCodeView(phone: phone, viewModel: viewModel)
    }
}
