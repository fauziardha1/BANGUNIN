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
    private static var persistentContainer: NSPersistentContainer = {
                let container = NSPersistentContainer(name: "Model")
                container.loadPersistentStores { description, error in
                    if let error = error {
                         fatalError("Unable to load persistent stores: (error)")
                    }
                }
                return container
            }()
    
    func updateAlarm() {

        do {
            try CoreDataManager.persistentContainer.viewContext.save()
        } catch {
            CoreDataManager.persistentContainer.viewContext.rollback()
        }

    }
    //
    func deleteAlarm(alarm: DataAlarm) {

        CoreDataManager.persistentContainer.viewContext.delete(alarm)

        do {
            try CoreDataManager.persistentContainer.viewContext.save()
        } catch {
            CoreDataManager.persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }

    }

    func getAllAlarms() -> [DataAlarm] {

        let fetchRequest: NSFetchRequest<DataAlarm> = DataAlarm.fetchRequest()

        do {
            return try CoreDataManager.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }

    }
    
    func saveAlarm(name: String, radius: String, color: String, alert: String, repeatsound: String, vibration: Float) {
        
        let alarm = DataAlarm(context: CoreDataManager.persistentContainer.viewContext)
        alarm.name = name
        alarm.radius = radius
        alarm.color = color
        alarm.alert = alert
        alarm.repeatsound = repeatsound
        alarm.vibration = vibration
        
        do {
            try CoreDataManager.persistentContainer.viewContext.save()
        } catch {
            print("Failed to save alarm \(error)")
        }
        
    }
    
    // save alarm with success status
    func saveAnAlarm(name: String, radius: String, color: String, alert: String, repeatsound: String, vibration: Float,  completion : (Bool) -> Void, onFailure : ( Error) -> Void){
        
        let context = CoreDataManager.persistentContainer.viewContext
        let newAlarm = DataAlarm(context: context)
        newAlarm.name = name
        newAlarm.radius = radius
        newAlarm.color = color
        newAlarm.alert = alert
        newAlarm.repeatsound = repeatsound
        newAlarm.vibration = vibration
        
        do {
            try context.save()
            
            completion(true)
        } catch {
            onFailure(error)
        }
        
        
    }
    
}
