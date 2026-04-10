import SwiftUI

struct PhotoView: View {
    var photo: Photo
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: photo.url)) { image in
                image.resizable()
                image.frame(minHeight: 90)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            HStack {
                Text(photo.id.description)
                Text(photo.title)
            }
            Text(photo.date, style: .relative)
        }
    }
}
