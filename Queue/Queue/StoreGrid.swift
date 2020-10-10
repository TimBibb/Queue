//
//  StoreGrid.swift
//  Queue
//
//  Created by Tim Bibbee on 10/10/20.
//

import SwiftUI

struct StoreGrid: View {
    let rows = Row.all()
        
    var body: some View {
        List {
            ForEach(rows) { row in
                HStack(alignment: .center) {
                    ForEach(row.cells) { cell in
                        Image(cell.imageURL)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }.padding(EdgeInsets.init(top: 0, leading: -20, bottom: 0, trailing: -20))
    }
}

struct StoreGrid_Previews: PreviewProvider {
    static var previews: some View {
        StoreGrid()
    }
}
