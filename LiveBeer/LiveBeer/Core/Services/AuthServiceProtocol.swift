import Foundation

protocol AuthServiceProtocol {
    func verifyPhone(_ phone: String) async throws
}

enum AuthServiceError: LocalizedError {
    case invalidPhone
    case verificationFailed

    var errorDescription: String? {
        switch self {
        case .invalidPhone:
            return "Неверный формат номера телефона"
        case .verificationFailed:
            return "Не удалось выполнить проверку номера"
        }
    }
}
