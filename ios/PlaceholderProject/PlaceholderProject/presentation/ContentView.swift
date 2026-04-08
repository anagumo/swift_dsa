import SwiftUI

struct ContentView: View {
    @State var photosViewModel: PhotosViewModel
    
    var body: some View {
        NavigationStack {
            switch photosViewModel.photosState {
            case .loading:
                Text("Cargando...")
            case .loaded:
                List(photosViewModel.photos, id: \.id) { item in
                    PhotoView(photo: item)
                }
                .navigationTitle("🖼️ Placeholder Photos")
            case .error:
                Button {
                    photosViewModel.load()
                } label: {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Try again")
                    }
                }
            }
        }.onAppear(perform: {
            photosViewModel.load()
        })
    }
}

#Preview {
    ContentView(
        photosViewModel: PhotosViewModel(
            placeholderSessionContract: PlaceholderSession(),
            placeholderLocal: PlaceholderLocal()
        )
    )
}


