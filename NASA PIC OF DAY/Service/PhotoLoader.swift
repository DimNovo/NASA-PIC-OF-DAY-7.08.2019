//
//  PhotoLoader.swift
//  NASA PIC OF DAY
//
//  Created by Dmitry Novosyolov on 06/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

final class NetService: ObservableObject {
    
    @Published var photos = [Photo]()
    
    let formater = DateFormatter()
    let calendar = Calendar.current
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    var query = ["api_key": "", "date": ""]
    
    func load() {
        guard baseURL.withQueries(query) != nil else { fatalError("URL isn't correct!")}
        
        formater.dateFormat = "yyyy-MM-dd"
        query["api_key"] = "your key ))"
        
        (0..<11).forEach { day in
            query["date"] = formater
                .string(from: calendar
                    .date(from: DateComponents(calendar: calendar,
                                               year: calendar.dateComponents([.year], from: Date()).year,
                                               month: calendar.dateComponents([.month], from: Date()).month,
                                               day: calendar.dateComponents([.day], from: Date()).day! - day))!)
            print(day, baseURL.withQueries(query)!)
            
            //MARK: - this API isn't realy responsibility...))
            guard query["date"] != formater.string(from: Date()) else { return }
            
            URLSession.shared.dataTask(with: baseURL.withQueries(query)!) { data,_,_ in
                guard let data = data, var photoInfo = try? JSONDecoder().decode(Photo.self, from: data) else { fatalError("Can't decode data!")}
                photoInfo.id = UUID.init()
                DispatchQueue.main.async {
                    self.photos.append(photoInfo)
                }
            }.resume()
        }
    }
}
