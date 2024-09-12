////
////  dataModel.swift
////  BANGUNIN
////
////  Created by Arief Ramadhan on 22/11/22.
////
//
//import Foundation
//import CoreData
//
//class CoreDataManager {
//    let persistentContainer: NSPersistentContainer
//    
//    init() {
//        persistentContainer = NSPersistentContainer(name: "Model")
//        persistentContainer.loadPersistentStores { (description, error) in
//            if let error = error {
//                fatalError("Core Data Store failed \(error.localizedDescription)")
//            }
//        }
//    }
//    
//            func updateAlarm() {
//    
//                do {
//                    try persistentContainer.viewContext.save()
//                } catch {
//                    persistentContainer.viewContext.rollback()
//                }
//    
//            }
//    //
//            func deleteAlarm(alarm: Alarm) {
//    
//                persistentContainer.viewContext.delete(alarm)
//    
//                do {
//                    try persistentContainer.viewContext.save()
//                } catch {
//                    persistentContainer.viewContext.rollback()
//                    print("Failed to save context \(error)")
//                }
//    
//            }
//    
//            func getAllAlarms() -> [Alarm] {
//    
//                let fetchRequest: NSFetchRequest<Alarm> = Alarm.fetchRequest()
//    
//                do {
//                    return try persistentContainer.viewContext.fetch(fetchRequest)
//                } catch {
//                    return []
//                }
//    
//            }
//    //
//    func saveAlarm(name: String, radius: Double) {
//        
//        let alarm = Alarm(context: persistentContainer.viewContext)
//        alarm.name = name
//        alarm.radius = radius
//        
//        do {
//            try persistentContainer.viewContext.save()
//        } catch {
//            print("Failed to save alarm \(error)")
//        }
//        
//    }
//    
//}
