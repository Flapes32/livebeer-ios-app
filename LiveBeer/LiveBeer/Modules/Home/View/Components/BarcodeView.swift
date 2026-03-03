import SwiftUI
import CoreImage
import UIKit

struct BarcodeView: View {
    let barcodeString: String
    let barcodeService: BarcodeServiceProtocol

    private let barcodeWidth: CGFloat = 300
    private let barcodeHeight: CGFloat = 74
    private let containerHeight: CGFloat = 96

    @State private var barcodeImage: CIImage?
    @State private var leadingQuietZone: CGFloat = 0
    @State private var trailingQuietZone: CGFloat = 0

    init(
        barcodeString: String,
        barcodeService: BarcodeServiceProtocol = BarcodeService()
    ) {
        self.barcodeString = barcodeString
        self.barcodeService = barcodeService
    }

    private var uiImage: UIImage? {
        guard let ciImage = barcodeImage else { return nil }
        let context = CIContext()
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
            return nil
        }
        return UIImage(cgImage: cgImage)
    }

    private var barsWidth: CGFloat {
        max(0, barcodeWidth - leadingQuietZone - trailingQuietZone)
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: AppRadius.sm, style: .continuous)
                .fill(AppColors.surface)
            RoundedRectangle(cornerRadius: AppRadius.sm, style: .continuous)
                .stroke(AppColors.dark.opacity(0.12), lineWidth: 1)

            VStack(spacing: 0) {
                if let uiImage {
                    Image(uiImage: uiImage)
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: barcodeWidth, height: barcodeHeight)
                } else {
                    Rectangle()
                        .fill(AppColors.gray.opacity(0.2))
                        .frame(width: barcodeWidth, height: barcodeHeight)
                }

                HStack(spacing: 0) {
                    Spacer()
                        .frame(width: leadingQuietZone)

                    HStack(spacing: 0) {
                        ForEach(Array(barcodeString.enumerated()), id: \.offset) { _, char in
                            Text(String(char))
                                .font(.system(size: 12, weight: .regular, design: .monospaced))
                                .foregroundStyle(AppColors.dark)
                                .frame(width: barsWidth / CGFloat(max(barcodeString.count, 1)))
                        }
                    }

                    Spacer()
                        .frame(width: trailingQuietZone)
                }
                .frame(width: barcodeWidth, height: 16)
                .offset(y: -2)
            }
        }
        .frame(width: barcodeWidth + 20, height: containerHeight)
        .frame(maxWidth: .infinity)
        .onAppear {
            let size = CGSize(width: barcodeWidth, height: barcodeHeight)
            barcodeImage = barcodeService.generateCode128(from: barcodeString, size: size)

            if let uiImage {
                let quietZones = detectQuietZones(in: uiImage, targetWidth: barcodeWidth)
                leadingQuietZone = quietZones.leading
                trailingQuietZone = quietZones.trailing
            }
        }
    }

    private func detectQuietZones(in image: UIImage, targetWidth: CGFloat) -> (leading: CGFloat, trailing: CGFloat) {
        guard let cgImage = image.cgImage else {
            return (0, 0)
        }
        guard let data = cgImage.dataProvider?.data, let bytes = CFDataGetBytePtr(data) else {
            return (0, 0)
        }

        let width = cgImage.width
        let height = cgImage.height
        let bytesPerRow = cgImage.bytesPerRow
        let bytesPerPixel = 4

        var firstDarkX = width
        var lastDarkX = 0

        for x in 0..<width {
            var hasDarkPixel = false

            for y in 0..<height {
                let index = y * bytesPerRow + x * bytesPerPixel
                let r = bytes[index]
                let g = bytes[index + 1]
                let b = bytes[index + 2]
                let a = bytes[index + 3]

                if a > 0, r < 200 || g < 200 || b < 200 {
                    hasDarkPixel = true
                    break
                }
            }

            if hasDarkPixel {
                firstDarkX = min(firstDarkX, x)
                lastDarkX = max(lastDarkX, x)
            }
        }

        guard firstDarkX <= lastDarkX else {
            return (0, 0)
        }

        let scale = targetWidth / CGFloat(max(width, 1))
        return (
            leading: CGFloat(firstDarkX) * scale,
            trailing: CGFloat(width - lastDarkX - 1) * scale
        )
    }
}

#Preview {
    BarcodeView(barcodeString: "1234567890")
        .padding()
        .background(AppColors.background)
}
