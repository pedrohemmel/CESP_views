//
//  Estrutura_CESPController.swift
//  CESP_view
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 01/09/22.
//

import Foundation
import CoreData

class Estrutura_CESPController: ObservableObject {
    let container = NSPersistentContainer(name: "Estrutura_CESP")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data: \(error.localizedDescription)")
            }
        }
    }
    
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data has been saved")
        } catch {
            print("Failed to save the data")
        }
    }
    
    func addEstrutura_CESP(nome_estrutura: String, id_cesp: Int64, qtd_estrutura: Int64, context: NSManagedObjectContext) {
        let estrutura_cesp = Estrutura_CESP(context: context)
        estrutura_cesp.nome_estrutura = nome_estrutura
        estrutura_cesp.id_cesp = id_cesp
        estrutura_cesp.qtd_estrutura = qtd_estrutura
        
        save(context: context)
    }
    
    func editEstrutura_CESP(estrutura_cesp: Estrutura_CESP, nome_estrutura: String, id_cesp: Int64, qtd_estrutura: Int64, context: NSManagedObjectContext) {
        estrutura_cesp.nome_estrutura = nome_estrutura
        estrutura_cesp.id_cesp = id_cesp
        estrutura_cesp.qtd_estrutura = qtd_estrutura
        
        save(context: context)
    }
}
