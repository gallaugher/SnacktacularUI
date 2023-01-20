//
//  SpotDetailPhotosScrollView.swift
//  SnacktacularUI
//  Created by John Gallaugher on 1/2/23
//  YouTube: YouTube.com/profgallaugher, Twitter: @gallaugher

import SwiftUI

struct SpotDetailPhotosScrollView: View {
//    struct FakePhoto: Identifiable {
//        let id = UUID().uuidString
//        var imageURLString = "https://firebasestorage.googleapis.com:443/v0/b/snacktacularui.appspot.com/o/9BZzOrPTQhwoR2V8i09Y%2F675C6C26-38FD-4B0C-9587-C4A0911DFD74.jpeg?alt=media&token=2030b59e-52bb-4f3f-81eb-7f5424d71575"
//    }
//
//    let photos = [FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto()]
    
    @State private var showPhotoViewerView = false
    @State private var uiImage = UIImage()
    @State var selectedPhoto = Photo()
    var photos: [Photo]
    var spot: Spot
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack (spacing: 4) {
                ForEach(photos) { photo in
                    let imageURL = URL(string: photo.imageURLString) ?? URL(string: "")
                    
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            // Order is important here!
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipped()
                            .onTapGesture {
                                let renderer = ImageRenderer(content: image)
                                selectedPhoto = photo
                                uiImage = renderer.uiImage ?? UIImage()
                                showPhotoViewerView.toggle()
                            }
                        
                    } placeholder: {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                }
            }
        }
        .frame(height: 80)
        .padding(.horizontal, 4)
        .sheet(isPresented: $showPhotoViewerView) {
            PhotoView(photo: $selectedPhoto, uiImage: uiImage, spot: spot)
        }
    }
}

struct SpotDetailPhotosScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SpotDetailPhotosScrollView(photos: [Photo(imageURLString: "https://firebasestorage.googleapis.com:443/v0/b/snacktacularui.appspot.com/o/9BZzOrPTQhwoR2V8i09Y%2FB59BDF50-A3A9-441E-BDD9-DBB77017F5D6.jpeg?alt=media&token=b2cda875-b509-4fa9-9889-57ba81412561")], spot: Spot(id: "9BZzOrPTQhwoR2V8i09Y"))
    }
}
