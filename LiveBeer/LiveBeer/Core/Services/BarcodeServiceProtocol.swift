import CoreImage

protocol BarcodeServiceProtocol {
    func generateCode128(from string: String, size: CGSize) -> CIImage?
}
