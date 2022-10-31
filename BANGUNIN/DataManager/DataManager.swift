//
//  DataManager.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 31/10/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    //
    //        func updateALAe() {
    //
    //            do {
    //                try persistentContainer.viewContext.save()
    //            } catch {
    //                persistentContainer.viewContext.rollback()
    //            }
    //
    //        }
    //
    //        func deleteMovie(movie: Alarm) {
    //
    //            persistentContainer.viewContext.delete(movie)
    //
    //            do {
    //                try persistentContainer.viewContext.save()
    //            } catch {
    //                persistentContainer.viewContext.rollback()
    //                print("Failed to save context \(error)")
    //            }
    //
    //        }
    //
    //        func getAllMovies() -> [Movie] {
    //
    //            let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
    //
    //            do {
    //                return try persistentContainer.viewContext.fetch(fetchRequest)
    //            } catch {
    //                return []
    //            }
    //
    //        }
    //
    func saveMovie(name: String) {
        
        let movie = Alarm(context: persistentContainer.viewContext)
        movie.name = name
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save movie \(error)")
        }
        
    }
    
}
