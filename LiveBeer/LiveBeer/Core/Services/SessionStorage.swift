import Foundation

final class SessionStorage: SessionStorageProtocol {
    // MARK: - Keys
    
    private enum Keys {
        static let isAuthorized = "session.isAuthorized"
        static let phone = "session.phone"
        static let userName = "session.userName"
    }
    
    // MARK: - Properties
    
    private let userDefaults: UserDefaults
    
    var isAuthorized: Bool {
        get {
            userDefaults.bool(forKey: Keys.isAuthorized)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.isAuthorized)
        }
    }
    
    var phone: String? {
        get {
            userDefaults.string(forKey: Keys.phone)
        }
        set {
            if let phone = newValue {
                userDefaults.set(phone, forKey: Keys.phone)
            } else {
                userDefaults.removeObject(forKey: Keys.phone)
            }
        }
    }
    
    var userName: String? {
        get {
            userDefaults.string(forKey: Keys.userName)
        }
        set {
            if let userName = newValue {
                userDefaults.set(userName, forKey: Keys.userName)
            } else {
                userDefaults.removeObject(forKey: Keys.userName)
            }
        }
    }
    
    // MARK: - Init
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    // MARK: - Methods
    
    func reset() {
        isAuthorized = false
        phone = nil
        userName = nil
    }
}
