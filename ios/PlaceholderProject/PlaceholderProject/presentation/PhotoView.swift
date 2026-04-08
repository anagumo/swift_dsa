import SwiftUI

struct PhotoView: View {
    var photo: Photo
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: photo.url)) { phase in
                phase.image?
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            }
            HStack {
                Text(photo.id.description)
                Text(photo.title)
            }
            Text(photo.date, style: .relative)
        }
    }
}
