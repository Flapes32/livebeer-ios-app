import Foundation

final class ProfileViewModel: ObservableObject {
    // MARK: - Properties

    private weak var output: ProfileOutput?

    // MARK: - Init

    init(output: ProfileOutput?) {
        self.output = output
    }
}
