//
//  StoreGrid.swift
//  Queue
//
//  Created by Tim Bibbee on 10/10/20.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct StoreGrid: View {
    let rows = Row.all()
    var user: String = ""
    @State private var queuing: Bool = false
    @State var merchant: String = ""
    @State var place: Int = 0
    let db = Firestore.firestore()
    
    init(username: String) {
        user = username
    }
    var body: some View {
        
        NavigationView {
            if (!queuing) {
                List {
                    ForEach(rows) { row in
                        HStack(alignment: .center) {
                            ForEach(row.cells) { cell in
                                Image(cell.imageURL)
                                    .resizable()
                                    .scaledToFit()
                                    .onTapGesture{
                                        let doc = db.collection("queues").document(cell.merchant)
                                        doc.getDocument { (document, error) in
                                            if let document = document, document.exists {
                                                let dataDescription = document.get("queue") as! NSArray
                                                place = dataDescription.count
                                                merchant = cell.merchant
                                            } else {
                                                print("Document does not exist")
                                            }
                                        }
                                        doc.updateData([
                                            "queue": FieldValue.arrayUnion([user])
                                        ])
                                        queuing = true
                                    }
                            }
                        }
                    }
                }
            }else{
                QueueView(place: place, user: user, merchant: merchant, queuing: $queuing)
            }
        }.padding(EdgeInsets.init(top: 0, leading: -20, bottom: 0, trailing: -20))
        .navigationBarTitle(Text(user), displayMode: .inline)
    }
}
//
//struct StoreGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreGrid(user)
//    }
//}
