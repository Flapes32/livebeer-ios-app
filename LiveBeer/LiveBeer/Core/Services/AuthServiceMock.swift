import Foundation

struct AuthServiceMock: AuthServiceProtocol {
    enum Scenario {
        case success
        case failure
    }

    private let scenario: Scenario
    private let delayNanoseconds: UInt64
    private let acceptedPhoneDigits: String?

    init(
        scenario: Scenario = .success,
        delayNanoseconds: UInt64 = 700_000_000,
        acceptedPhoneDigits: String? = nil
    ) {
        self.scenario = scenario
        self.delayNanoseconds = delayNanoseconds
        self.acceptedPhoneDigits = acceptedPhoneDigits
    }

    func verifyPhone(_ phone: String) async throws {
        try await Task.sleep(nanoseconds: delayNanoseconds)

        let digits = phone.filter(\.isNumber)

        guard digits.count >= 10 else {
            throw AuthServiceError.invalidPhone
        }

        if let acceptedPhoneDigits, digits != acceptedPhoneDigits {
            throw AuthServiceError.invalidPhone
        }

        switch scenario {
        case .success:
            return
        case .failure:
            throw AuthServiceError.verificationFailed
        }
    }
}
