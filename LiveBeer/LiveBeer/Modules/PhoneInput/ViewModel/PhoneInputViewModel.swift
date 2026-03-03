import Foundation

@MainActor
final class PhoneInputViewModel: ObservableObject {
    @Published private(set) var phoneText: String = ""
    @Published private(set) var isValid: Bool = false
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorText: String?

    private let formatter: PhoneFormatterServiceProtocol
    private let authService: AuthServiceProtocol
    private weak var output: PhoneInputOutput?

    init(
        formatter: PhoneFormatterServiceProtocol = PhoneFormatterService(),
        authService: AuthServiceProtocol = AuthServiceMock(),
        output: PhoneInputOutput?
    ) {
        self.formatter = formatter
        self.authService = authService
        self.output = output
    }

    func didChangePhone(_ value: String) {
        phoneText = formatter.format(value)
        isValid = formatter.isValid(phoneText)
        errorText = nil
    }

    func didTapBack() {
        output?.phoneInputDidTapBack()
    }

    func didTapRegistration() {
        output?.phoneInputDidTapRegistration()
    }

    func didTapContinue() async {
        guard !isLoading else { return }

        let digits = phoneText.filter(\.isNumber)
        if !isValid || digits.count != 11 || (!digits.hasPrefix("7") && !digits.hasPrefix("8")) {
            errorText = "Неверный ввод"
            phoneText = ""
            isValid = false
            return
        }

        isLoading = true
        errorText = nil
        defer { isLoading = false }

        do {
            try await authService.verifyPhone(phoneText)
            output?.phoneInputDidSucceed()
        } catch {
            errorText = (error as? LocalizedError)?.errorDescription ?? "Ошибка проверки номера"
        }
    }
}
