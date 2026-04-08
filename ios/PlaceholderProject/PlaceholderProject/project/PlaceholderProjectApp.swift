import SwiftUI

@main
struct PlaceholderProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                photosViewModel: PhotosViewModel(
                    placeholderSessionContract: PlaceholderSession(),
                    placeholderLocal: PlaceholderLocal()
                )
            )
        }
    }
}
