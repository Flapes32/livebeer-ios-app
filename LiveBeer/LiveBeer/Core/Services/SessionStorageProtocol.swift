import Foundation

protocol SessionStorageProtocol {
    var isAuthorized: Bool { get set }
    var phone: String? { get set }
    var userName: String? { get set }
    
    func reset()
}
