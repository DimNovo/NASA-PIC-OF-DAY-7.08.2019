//
//  DetailImage.swift
//  NASA PIC OF DAY
//
//  Created by Dmitry Novosyolov on 06/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct DetailImage: View {
    var photo: Photo
    var body: some View {
        VStack {
            DetailHeader(photo: photo)
            DetailExplanation(photo: photo)
            DetailFooter(photo: photo)
        }.padding(5)
    }
}

struct DetailHeader: View {
    var photo: Photo
    @State private var tapped = false
    var body: some View {
        VStack {
            Text(photo.title)
                .font(.headline)
                .shadow(color: .secondary, radius: 10, x: 3, y: 3)
            Divider()
            URLImage(url: photo.url)
                .cornerRadius(tapped ? 50 : 8)
                .shadow(color: .secondary, radius: 5)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) { self.tapped.toggle()}}
                .frame(height: tapped ? 100 : nil)
                .scaleEffect(tapped ? 0.45 : 1.0)
        }
    }
}

struct DetailExplanation: View {
    var photo: Photo
    var body: some View {
        List { Text(photo.explanation)}
            .lineLimit(nil)
            .foregroundColor(.secondary)
    }
}

struct DetailFooter: View {
    var photo: Photo
    @State private var isSelected = false
    var body: some View {
        VStack {
            Image(systemName: isSelected ? "star.fill" : "star")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(.yellow)
                .shadow(color: isSelected ? .primary : .secondary, radius: 3)
                .onTapGesture { withAnimation(.easeInOut) { self.isSelected.toggle()}}
            VStack {
                Text(photo.date)
                Text("© \(photo.copyright ?? "NASA")")
            }
            .padding(.top, 7)
            .font(.footnote)
            .foregroundColor(.secondary)
        }
    }
}

#if DEBUG
struct DetailImage_Previews: PreviewProvider {
    static var previews: some View {
        DetailImage(photo: Photo.all())
    }
}
#endif
