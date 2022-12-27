//
//  ViewModel.swift
//  FirebaseCoreData
//
//  Created by ALYSSON DODO on 27/12/22.
//

import Foundation
import CoreData

class ViewModel {
    
    private var listPerson: [Person] = []
    
    lazy var persistenContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FirebaseCoreData")
        container.loadPersistentStores { storyDescription, error in
            if error != nil{
                fatalError(" \(error?.localizedDescription ?? "")")
            }
        }
        return container
    }()
    
    public func loadData( completion: () -> Void){
        let context = persistenContainer.viewContext
        let request = NSFetchRequest<Person>(entityName: "Person")
        let result = try? context.fetch(request)
        listPerson = result ?? []
        completion()
    }
    
    private func updatePerson(name: String, age: Int) -> Bool{
        let context = persistenContainer.viewContext
        let request = NSFetchRequest<Person>(entityName: "Person")
        // filtro com elemento
        request.predicate = NSPredicate( format: "name == %@", name)
        let result = try? context.fetch(request)
        if (result ?? []).isEmpty {
            // n existe alguem com esse nome, pode cadastrar
            return false
        }else{
            // existe alguem com esse nome
            result?.first?.age = Int64(age)
            do {
                try context.save() // salvando dados
                
            }catch{
                // deu ruim
                return true
            }
            return true
        }
    }
    
    public func loadCurrent( indexPath: IndexPath) -> Person{
        return listPerson[indexPath.row]
    }
    func addPeson(name: String, age: Int, completion: (_ success: Bool) -> Void){
        if updatePerson(name: name, age: age){
            completion(true)
        }else{
        let context = persistenContainer.viewContext
        let person = Person(context: context)
        person.name = name
        person.age = Int64(age)
        
        do {
            try context.save()
            completion(true)
        }catch{
            // deu ruim
            completion(false)
        }
    }
}
    
    func removePeson(){
        
    }
    
    
   public var numberOfRowsInSection : Int {
       return listPerson.count //listData.count
    }
    
    public var heightForRowAt : CGFloat {
        return 100
    }
}
