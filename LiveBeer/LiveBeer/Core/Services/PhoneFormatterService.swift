import Foundation

protocol PhoneFormatterServiceProtocol {
    func sanitize(_ rawInput: String) -> String
    func format(_ rawInput: String) -> String
    func isValid(_ rawInput: String) -> Bool
}

struct PhoneFormatterService: PhoneFormatterServiceProtocol {
    private let maxDigits = 11
    private let requiredDigits = 11

    func sanitize(_ rawInput: String) -> String {
        let digits = rawInput.filter(\.isNumber)
        guard !digits.isEmpty else { return "" }

        let normalized: String

        if digits.hasPrefix("8") {
            normalized = "7" + digits.dropFirst()
        } else if digits.hasPrefix("7") {
            normalized = digits
        } else if digits.count <= 10 {
            normalized = "7" + digits
        } else {
            normalized = "7" + digits.suffix(10)
        }

        return String(normalized.prefix(maxDigits))
    }

    func format(_ rawInput: String) -> String {
        let digits = sanitize(rawInput)
        guard !digits.isEmpty else { return "" }

        var result = "+7"
        let local = String(digits.dropFirst())

        if !local.isEmpty {
            result += " ("
            result += String(local.prefix(3))
        }
        if local.count >= 3 {
            result += ") "
            result += String(local.dropFirst(3).prefix(3))
        }
        if local.count >= 6 {
            result += "-"
            result += String(local.dropFirst(6).prefix(2))
        }
        if local.count >= 8 {
            result += "-"
            result += String(local.dropFirst(8).prefix(2))
        }

        return result
    }

    func isValid(_ rawInput: String) -> Bool {
        sanitize(rawInput).count == requiredDigits
    }
}
