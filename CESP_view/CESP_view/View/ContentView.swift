//
//  ContentView.swift
//  CESP_view
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 30/08/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(entity: CESP.entity(), sortDescriptors: [NSSortDescriptor(key: "id_cesp", ascending: false)]) var centrosESP : FetchedResults<CESP>
    
    @State private var apresentaAddNewCesp = false
    var body: some View {
   
        NavigationView {
            VStack {
                
                //Creating the list that will show all of the Centros Esportivos
                List {
                    ForEach(centrosESP) { centroESP in
                        NavigationLink(
                            destination: infoCespView(
                            nome_cesp: .constant(centroESP.nome_cesp ?? ""),
                            endereco_cesp: .constant(centroESP.endereco_cesp ?? ""),
                            telefone_cesp: .constant(centroESP.telefone_cesp ?? ""),
                            hf_cesp: .constant(centroESP.hf_cesp ?? ""),
                            hf_fds_feriado_cesp: .constant(centroESP.hf_feriado_fds_cesp ?? "")),
                            label: {
                            Text(centroESP.nome_cesp ?? "")
                                
                            })
                        
                    }
                }
                
                //Adding a link that give the opportunity to create a new Centro Esportivo
                NavigationLink(destination: addNewCespView(), label: {
                    Text("Criar Novo")
                        .foregroundColor(.black)
                })
            }
            .navigationTitle("Centros Esportivos")
            
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
