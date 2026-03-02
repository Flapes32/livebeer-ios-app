import Foundation

struct AuthServiceMock: AuthServiceProtocol {
    enum Scenario {
        case success
        case failure
    }

    private let scenario: Scenario
    private let delayNanoseconds: UInt64

    init(
        scenario: Scenario = .success,
        delayNanoseconds: UInt64 = 700_000_000
    ) {
        self.scenario = scenario
        self.delayNanoseconds = delayNanoseconds
    }

    func verifyPhone(_ phone: String) async throws {
        try await Task.sleep(nanoseconds: delayNanoseconds)

        guard phone.filter(\.isNumber).count >= 10 else {
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
