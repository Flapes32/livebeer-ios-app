import Foundation

final class InformationViewModel: ObservableObject {
    // MARK: - Properties

    private weak var output: InformationOutput?

    // MARK: - Init

    init(output: InformationOutput?) {
        self.output = output
    }
}
