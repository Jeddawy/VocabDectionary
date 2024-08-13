//
//  RealmManagerProtocol.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation

protocol RealmManagerProtocol: AnyObject {
    associatedtype EntityType

    func save(item: EntityType) throws
    
    func save(items: [EntityType]) throws
    
    func update(block: @escaping () -> ()) throws
    
    func delete(item: EntityType) throws
    
    func deleteAll() throws
        
    func fetchAll() -> [EntityType]
}

protocol Entity {
    associatedtype RealmEntityType
    var realmObject: RealmEntityType { get }
}

protocol RealmEntity {
    associatedtype EntityType
    var entityObject: EntityType { get }
}
