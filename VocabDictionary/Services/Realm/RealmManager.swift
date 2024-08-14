//
//  RealmManager.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation
import RealmSwift

class RealmManager<T>: RealmManagerProtocol where T: RealmEntity, T: Object, T.EntityType: Entity {
    
    typealias RealmEntityType = T
    
    func save(item: T.EntityType) throws {
           let realm = try Realm()
           try realm.write {
               realm.add(item.realmObject as! T)
           }
       }

       func save(items: [T.EntityType]) throws {
           let realm = try Realm()
           try realm.write {
               items.forEach {
                   realm.add($0.realmObject as! T, update: .modified)
               }
           }
       }

    func update(block: @escaping () -> ()) throws {
        let realm = try Realm()

        try realm.write() {
            block()
        }
    }
    
    func delete(item: T.EntityType) throws {
        let realm = try Realm()

        try realm.write() {
            realm.delete(item.realmObject as! T)
        }
    }
    
    func deleteAll() throws {
        let realm = try Realm()

        try realm.write() {
            realm.delete((realm.objects(T.self)))
        }
    }
    
    func fetchAll() -> [T.EntityType] {
        do {
             let realm = try Realm()
             return realm.objects(T.self).compactMap { $0.entityObject }
         } catch {
             print("Error fetching objects: \(error)")
             return []
         }
    }
}
