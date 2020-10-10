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
}

extension Row {
    
    static func all() -> [Row] {
        
        return [
            
            Row(cells: [Cell(imageURL: "a1"), Cell(imageURL: "a2")]),
            Row(cells: [Cell(imageURL: "a3"), Cell(imageURL: "a1")]),
            Row(cells: [Cell(imageURL: "a2"), Cell(imageURL: "a3")]),
            Row(cells: [Cell(imageURL: "a1"), Cell(imageURL: "a2")]),
            Row(cells: [Cell(imageURL: "a3"), Cell(imageURL: "a1")]),
            Row(cells: [Cell(imageURL: "a2"), Cell(imageURL: "a3")]),
        
        ]
        
    }
    
}


