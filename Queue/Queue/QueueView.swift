//
//  QueueView.swift
//  Queue
//
//  Created by Tim Bibbee on 10/11/20.
//

import SwiftUI


struct QueueView: View {
    var _user: String = ""
    var _merchant: String = ""
    var _place: Int = 0
    
    @Binding var queuing : Bool
    
    init(place: Int, user: String, merchant: String, queuing: Binding<Bool>){
        _place = place
        _user = user
        _merchant = merchant
        self._queuing = queuing
    }
    var body: some View {
        VStack {
            Text("\(_user), you are number \(_place) in line for \(_merchant).\nThe approximate wait time is \(_place * 5) minutes.")
            Button("Queue somewhere else") {
                queuing = false
            }
        }
    }
}
/*
struct QueueView_Previews: PreviewProvider {
    static var previews: some View {
        QueueView()
    }
}
*/
