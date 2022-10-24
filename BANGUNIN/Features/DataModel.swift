//
//  DataModel.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 23/10/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Alarm")
    
    init() {
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Save")
        } catch {
            print("We could not save the data")
        }
    }
    func add( name: String, radius: Double, context: NSManagedObjectContext) {
        let alarm = Alarm(context: context)
        alarm.name = name
        alarm.radius = radius
        
        save(context: context)
    }
    func editAlarm( alarm: Alarm, name: String, radius: Double, context: NSManagedObjectContext){
        alarm.name = name
        alarm.radius = radius
        
        save(context: context)
    }
    
}
