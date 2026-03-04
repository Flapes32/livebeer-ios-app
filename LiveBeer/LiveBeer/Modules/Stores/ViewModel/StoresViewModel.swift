import Foundation

final class StoresViewModel: ObservableObject {
    // MARK: - Properties

    private weak var output: StoresOutput?

    // MARK: - Init

    init(output: StoresOutput?) {
        self.output = output
    }
}
