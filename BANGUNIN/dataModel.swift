//
//  dataModel.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 22/11/22.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func updateAlarm() {

        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }

    }
    //
    func deleteAlarm(alarm: DataAlarm) {

        persistentContainer.viewContext.delete(alarm)

        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }

    }

    func getAllAlarms() -> [DataAlarm] {

        let fetchRequest: NSFetchRequest<DataAlarm> = DataAlarm.fetchRequest()

        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }

    }
    
    func saveAlarm(name: String, radius: String, color: String) {
        
        let alarm = DataAlarm()
        alarm.name = name
        alarm.radius = radius
        alarm.color = color
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save alarm \(error)")
        }
        
    }
    
}
