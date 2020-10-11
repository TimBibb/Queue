//
//  StoreGrid.swift
//  Queue
//
//  Created by Tim Bibbee on 10/10/20.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct StoreGrid: View {
    let rows = Row.all()
    var user: String = ""
    let db = Firestore.firestore()
    
    init(username: String) {
        user = username
    }
    var body: some View {
        List {
            Text(user)
            ForEach(rows) { row in
                HStack(alignment: .center) {
                    ForEach(row.cells) { cell in
                        Image(cell.imageURL)
                            .resizable()
                            .scaledToFit()
                            .onTapGesture{
                                let document = db.collection("queues").document(cell.merchant)
                                // Atomically add a new region to the "regions" array field.
                                document.updateData([
                                    "queue": FieldValue.arrayUnion([user])
                                ])
                            }
                    }
                }
            }
        }.padding(EdgeInsets.init(top: 0, leading: -20, bottom: 0, trailing: -20))
    }
}
//
//struct StoreGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreGrid(user)
//    }
//}
