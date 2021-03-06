//
//  ContentView.swift
//  Queue
//
//  Created by Tim Bibbee on 10/10/20.
//

import SwiftUI
import CoreData
import Firebase
import CodeScanner

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    struct defaultsKeys {
        static let keyOne = "username"
    }
    
    //@EnvironmentObject var session: SessionStore
    /*
    func getUser () {
        session.listen()
    }
    */
    //let db = Firestore.firestore()
    let defaults = UserDefaults.standard
    @State var signInSuccess = false
    @State var username = ""
    
    var body: some View {
        return Group {
            if (signInSuccess) {
                TabView {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Sebastian Molina") { result in
                        switch result {
                        case .success(let code):
                            print("Found code: \(code)")
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("QR")
                    }
                    
                    StoreGrid(username: username)
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Locations")
                        }
                }
            }
            else {
                LoginFormView(signInSuccess: $signInSuccess, username: $username)
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).environmentObject(SessionStore())
    }
}

/*
 NavigationView {
     if (session.session != nil){
         TabView {
             CodeScannerView(codeTypes: [.qr], simulatedData: "Sebastian Molina") { result in
                 switch result {
                 case .success(let code):
                     print("Found code: \(code)")
                 case .failure(let error):
                     print(error.localizedDescription)
                 }
             }
             .tabItem {
                 Image(systemName: "list.dash")
                 Text("QR")
             }
             
             StoreGrid()
                 .tabItem {
                     Image(systemName: "list.dash")
                     Text("Locations")
                 }
         }
     }else{
         SignInView()
     }
 }.onAppear(perform: getUser)
 .onDisappear(perform: session.unbind)
 */
