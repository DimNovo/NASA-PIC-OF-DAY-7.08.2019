//
//  SeparatedImages.swift
//  NASA PIC OF DAY
//
//  Created by Dmitry Novosyolov on 06/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct SeparatedImages: View {
    @ObservedObject private var netService = NetService()
    init() { self.netService.load()}
    var body: some View {
        let separatedImages = netService.photos.separated(into: 2)
        return ForEach(0..<separatedImages.count, id: \.self) { index in
            HStack {
                ForEach(separatedImages[index]) { photo in
                    ImageCell(photo: photo)
                }
            }
        }
    }
}

struct ImageCell: View {
    var photo: Photo
    @State private var isDetail = false
    var body: some  View {
        VStack {
            URLImage(url: photo.url)
                .frame(width: 160, height: 110, alignment: .leading)
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .shadow(color: .secondary, radius: 10)
                .onTapGesture {
                    withAnimation(.easeInOut) { self.isDetail.toggle()}}
            
            Text(photo.date)
                .font(.caption)
                .italic()
            
        }.sheet(isPresented: $isDetail) { DetailImage(photo: self.photo)
        }
    }
}

#if DEBUG
struct SeparatedImages_Previews: PreviewProvider {
    static var previews: some View {
        SeparatedImages()
    }
}
#endif
