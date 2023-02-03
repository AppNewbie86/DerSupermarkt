//
//  InventarViewModel.swift
//  DerSupermarkt
//
//  Created by Marcel Zimmermann on 03.02.23.
//

import Foundation
import CoreData

class InventarViewModel : ObservableObject{
    
    let container : NSPersistentContainer
    @Published var savedInventarList : [InventarEntity] = []
    
    
    
    init(){
        container = NSPersistentContainer(name: "InventarContainer")
        container.loadPersistentStores { desc, error in
            if let error = error{
                print("Error loadgin Core data. \(error)")
            }else {
                print("yeah it worked tooo !!!!")
            }
        }
    }
    
}
