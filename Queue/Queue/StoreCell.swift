//
//  StoreCell.swift
//  Queue
//
//  Created by Tim Bibbee on 10/10/20.
//

import Foundation
import SwiftUI

struct Row: Identifiable {
    let id = UUID()
    let cells: [Cell]
}

struct Cell: Identifiable {
    let id = UUID()
    let imageURL: String
    let merchant: String
}

extension Row {
    
    static func all() -> [Row] {
        return [
            Row(cells: [Cell(imageURL: "a1", merchant: "dmv"), Cell(imageURL: "a2", merchant: "starbucks")]),
            Row(cells: [Cell(imageURL: "a3", merchant: "universal")])
        ]

    }
    
}


