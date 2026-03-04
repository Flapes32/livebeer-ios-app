import Foundation

@MainActor
final class ActivationCodeViewModel: ObservableObject {
    @Published private(set) var codeText: String = ""
    @Published private(set) var errorText: String?
    @Published private(set) var isLoading: Bool = false
    
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
        codeDigits.count == 4 && !isLoading
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
        guard !isLoading else { return }
        
        if codeDigits == expectedCode {
            isLoading = true
            // Небольшая задержка для плавности
            Task {
                try? await Task.sleep(nanoseconds: 300_000_000)
                output?.activationCodeDidSucceed()
            }
        } else {
            errorText = "Неверный код"
        }
    }
}
