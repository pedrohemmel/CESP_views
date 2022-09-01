//
//  CESPController.swift
//  CESP_view
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 30/08/22.
//

import Foundation
import CoreData

//Class that is going to have the CRUD process of the app
class CESPController: ObservableObject {
    let container = NSPersistentContainer(name: "CESPModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    //Function used to save the changes made in the data base
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("The data has been saved")
        } catch {
            print("Failed to save the data")
        }
    }
    
    func addCESP(nome_cesp: String, endereco_cesp: String, telefone_cesp: String, hf_cesp: String, hf_feriado_fds_cesp: String, context: NSManagedObjectContext) {
        let cesp = CESP(context: context)
        cesp.id_cesp = UUID()
        cesp.nome_cesp = nome_cesp
        cesp.endereco_cesp = endereco_cesp
        cesp.telefone_cesp = telefone_cesp
        cesp.hf_cesp = hf_cesp
        cesp.hf_feriado_fds_cesp = hf_feriado_fds_cesp
        
        save(context: context)
    }
    
    func editCESP(cesp: CESP, nome_cesp: String, endereco_cesp: String, telefone_cesp: String, hf_cesp: String, hf_feriado_fds_cesp: String, context: NSManagedObjectContext) {
        cesp.nome_cesp = nome_cesp
        cesp.endereco_cesp = endereco_cesp
        cesp.telefone_cesp = telefone_cesp
        cesp.hf_cesp = hf_cesp
        cesp.hf_feriado_fds_cesp = hf_feriado_fds_cesp
        
        save(context: context)
    }
}
