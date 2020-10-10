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

extension Row {
    
}

extension Row {
    
    static func all() -> [Row] {
        
        return [
            
            Row(cells: [Cell(imageURL: "a1"), Cell(imageURL: "d1")]),
            Row(cells: [Cell(imageURL: "a2"), Cell(imageURL: "e1")]),
            Row(cells: [Cell(imageURL: "a3"), Cell(imageURL: "e1")]),
            Row(cells: [Cell(imageURL: "a1"), Cell(imageURL: "d1")]),
            Row(cells: [Cell(imageURL: "a2"), Cell(imageURL: "e1")]),
            Row(cells: [Cell(imageURL: "a3"), Cell(imageURL: "e1")]),
        
        ]
        
    }
    
}

struct Cell: Identifiable {
    let id = UUID()
    let imageURL: String
}
