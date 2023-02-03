//
//  EditView.swift
//  DerSupermarkt
//
//  Created by Marcel Zimmermann on 03.02.23.
//

import SwiftUI

struct EditView: View {
    
    @State var workers: [String] = ["MitarbeiterListe"]
    @State var newWorker: String = ""
    
    @State var inventar: [String] = ["InventarListe"]
    @State var newInventarProduct: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {

                    TextField("add here a new worker", text: $newWorker).foregroundColor(Color.black)
                        .background(Color.white)
                    Button(action: {
                        self.workers.append(self.newWorker)
                        self.newWorker = ""
                    }) {
                        Text("Mitarbeiter hinzufügen")
                            .frame(width: 150, height: 55)
                            .foregroundColor(Color.orange)
                            .cornerRadius(10)
                    }
                }
                .padding()
                List {
                    ForEach(workers, id: \.self) { worker in
                        Text(worker)
                    }
                    .onDelete(perform: delete)
                }
                .background(Color.blue)
                
                List {
                    ForEach(inventar, id: \.self) { productInventar in
                        Text(productInventar)
                    }
                    .onDelete(perform: delete)
                }
                .background(Color.gray)

            }
            .navigationBarTitle("Mitarbeiter hinzufügen")
            .background(Color.gray)
            .navigationBarItems(trailing: EditButton())
            .background(Color.green)
            .foregroundColor(Color.blue)
        }
    }

    func delete(at offsets: IndexSet) {
        workers.remove(atOffsets: offsets)
    }
}


struct EditView_Previews: PreviewProvider {
static var previews: some View {
    EditView()
  }
}
