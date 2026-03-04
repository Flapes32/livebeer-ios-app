import Foundation

@MainActor
final class ActivationCodeViewModel: ObservableObject {
    @Published private(set) var codeText: String = ""
    @Published private(set) var errorText: String?
    
    private let expectedCode: String
    private weak var output: ActivationCodeOutput?
    
    init(
        expectedCode: String = "1111",
        output: ActivationCodeOutput?
    ) {
        self.expectedCode = expectedCode
        self.output = output
    }
    
    var codeDigits: String {
        String(codeText.filter(\.isNumber).prefix(4))
    }
    
    var isSubmitEnabled: Bool {
        codeDigits.count == 4
    }
    
    func didChangeCode(_ value: String) {
        let digits = value.filter(\.isNumber)
        codeText = String(digits.prefix(4))
        errorText = nil
    }
    
    func didTapBack() {
        output?.activationCodeDidTapBack()
    }
    
    func didTapSubmit() {
        if codeDigits == expectedCode {
            output?.activationCodeDidSucceed()
        } else {
            errorText = "Неверный код"
        }
    }
}
