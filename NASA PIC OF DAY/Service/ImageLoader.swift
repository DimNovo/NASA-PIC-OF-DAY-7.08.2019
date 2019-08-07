//
//  ImageLoader.swift
//  NASA PIC OF DAY
//
//  Created by Dmitry Novosyolov on 06/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit

final class ImageLoader: ObservableObject {
    
   @Published var loadedImage: UIImage? = nil
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else { fatalError("URL isn't correct!")}
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else { fatalError(error!.localizedDescription)}
            
            DispatchQueue.main.async {
                self.loadedImage = UIImage(data: data)
            }
        }.resume()
    }
}
