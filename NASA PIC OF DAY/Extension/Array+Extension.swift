//
//  Array+Extension.swift
//  NASA PIC OF DAY
//
//  Created by Dmitry Novosyolov on 06/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

extension Array {
    func separated(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size)
            .map { Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
