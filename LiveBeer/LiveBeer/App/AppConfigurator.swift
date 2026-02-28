import SwiftUI

struct AppConfigurator {
    func makeWelcomeModule() -> AnyView {
        AnyView(
            Text("Welcome")
                .font(.title)
        )
    }

    func makePhoneInputModule() -> AnyView {
        AnyView(
            Text("Phone")
                .font(.title)
        )
    }

    func makeHomeModule() -> AnyView {
        AnyView(
            Text("Home")
                .font(.title)
        )
    }
}
