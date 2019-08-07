//
//  DetailImageView.swift
//  NASA PIC OF DAY
//
//  Created by Dmitry Novosyolov on 06/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct DetailImageView: View {
    var photo: Photo
    var body: some View {
        DetailImage(photo: photo)
    }
}

#if DEBUG
struct DetailImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageView(photo: Photo.all())
    }
}
#endif
