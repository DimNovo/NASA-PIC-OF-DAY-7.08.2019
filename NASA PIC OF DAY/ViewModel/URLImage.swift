//
//  URLImage.swift
//  NASA PIC OF DAY
//
//  Created by Dmitry Novosyolov on 06/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    init(url: String) {  self.imageLoader.load(url: url)}
    
    var body: some View {
        Image(uiImage: self.imageLoader.loadedImage ?? UIImage(systemName: "photo")!)
            .resizable()
    }
}

#if DEBUG
struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://apod.nasa.gov/apod/image/1908/VoidMap_Tully_960.jpg")
            .aspectRatio(contentMode: .fit)
    }
}
#endif
