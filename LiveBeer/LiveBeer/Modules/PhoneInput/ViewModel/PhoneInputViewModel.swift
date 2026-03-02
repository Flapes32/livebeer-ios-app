import Foundation

@MainActor
final class PhoneInputViewModel: ObservableObject {
    @Published private(set) var phoneText: String = ""
    @Published private(set) var isValid: Bool = false
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorText: String?

    private let formatter: PhoneFormatterServiceProtocol
    private let authService: AuthServiceProtocol
    private let onBack: () -> Void
    private let onSuccess: () -> Void
    private let onRegistration: () -> Void

    init(
        formatter: PhoneFormatterServiceProtocol = PhoneFormatterService(),
        authService: AuthServiceProtocol = AuthServiceMock(),
        onBack: @escaping () -> Void = {},
        onSuccess: @escaping () -> Void = {},
        onRegistration: @escaping () -> Void = {}
    ) {
        self.formatter = formatter
        self.authService = authService
        self.onBack = onBack
        self.onSuccess = onSuccess
        self.onRegistration = onRegistration
    }

    func didChangePhone(_ value: String) {
        phoneText = formatter.format(value)
        isValid = formatter.isValid(phoneText)
        errorText = nil
    }

    func didTapBack() {
        onBack()
    }

    func didTapRegistration() {
        onRegistration()
    }

    func didTapContinue() async {
        guard isValid, !isLoading else { return }

        isLoading = true
        errorText = nil
        defer { isLoading = false }

        do {
            try await authService.verifyPhone(phoneText)
            onSuccess()
        } catch {
            errorText = (error as? LocalizedError)?.errorDescription ?? "Ошибка проверки номера"
        }
    }
}
