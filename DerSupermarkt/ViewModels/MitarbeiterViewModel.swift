//
//  MitarbeiterViewModel.swift
//  DerSupermarkt
//
//  Created by Marcel Zimmermann on 03.02.23.
//

import Foundation
import CoreData

@MainActor class MitarbeiterViewModel : ObservableObject{
    
    let container : NSPersistentContainer
    @Published var savedMitarbeiterList : [MitarbeiterEntity] = []
    
    init(){
        container = NSPersistentContainer(name: "MitarbeiterContainer")
        container.loadPersistentStores { desc, error in
            if let error = error{
                print("Error loadgin Core data. \(error)")
            }else {
                print("yeah it worked !!!")
            }
        }
    }
    
}
