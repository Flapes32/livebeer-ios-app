import CoreImage

struct BarcodeService: BarcodeServiceProtocol {
    func generateCode128(from string: String, size: CGSize) -> CIImage? {
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else {
            return nil
        }

        let data = string.data(using: .ascii)
        filter.setValue(data, forKey: "inputMessage")

        guard let outputImage = filter.outputImage else {
            return nil
        }

        let scaleX = size.width / outputImage.extent.width
        let scaleY = size.height / outputImage.extent.height
        let transformedImage = outputImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))

        return transformedImage
    }
}
