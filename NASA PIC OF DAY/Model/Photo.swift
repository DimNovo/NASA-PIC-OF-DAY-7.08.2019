//
//  Photo.swift
//  NASA PIC OF DAY
//
//  Created by Dmitry Novosyolov on 06/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

struct Photo: Codable, Hashable, Identifiable {
    
    var id: UUID?
    var copyright: String?
    var date, title, explanation, url: String
}

extension Photo {
    static func all() -> Photo {
        Photo(id: .init(),
              copyright: nil,
              date: "2019-08-06",
              title: "The Local Void in the Nearby Universe",
              explanation: "What does our region of the Universe look like? Since galaxies are so spread out over the sky, and since our Milky Way Galaxy blocks part of the distant sky, it has been hard to tell. A new map has been made, however, using large-scale galaxy motions to infer what massive objects must be gravitating in the nearby universe. The featured map, spanning over 600 million light years on a side, shows that our Milky Way Galaxy is on the edge of the Virgo Cluster of Galaxies, which is connected to the Great Attractor -- an even larger grouping of galaxies. Also nearby are the massive Coma Cluster and the extensive Perseus-Pisces Supercluster. Conversely, we are also on the edge of huge region nearly empty of galaxies known as the Local Void.  The repulsive push by the Local Void combined with the gravitational pull toward the elevated galaxy density on the other side of the sky explains part of the mysteriously high speed our Galaxy has relative to the cosmic microwave background -- but not all.  To explore the local universe yourself, as determined by Cosmicflows-3, you are invited to zoom in and spin around this interactive 3D visualization.",
              url: "https://apod.nasa.gov/apod/image/1908/VoidMap_Tully_960.jpg")
    }
}
