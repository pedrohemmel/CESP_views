//
//  estruturasCespView.swift
//  CESP_view
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 02/09/22.
//

import SwiftUI
import CoreData

struct estruturasCespView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest(entity: Estrutura_CESP.entity(), sortDescriptors: [NSSortDescriptor(key: "id_estrutura", ascending: false)]) var estruturasCESP : FetchedResults<Estrutura_CESP>
    
    //Setting the variables that will receive informations from the infoCespView
    @Binding var id_cesp : UUID
    @Binding var nome_cesp : String
    
    @State private var listaEstruturas = [Estrutura_CESP]()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                
                
                List {
                    ForEach(self.listaEstruturas) { estrutura in
                        Text(estrutura.nome_estrutura ?? "")
                    }
                }
                
            }
            .onAppear(perform: {
                filtraEstruturas()
            })
            .navigationTitle(nome_cesp)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    NavigationLink(
                        destination: addNewEstruturaView(),
                        label: {
                           Image(systemName: "plus")
                        })
                    Button(action: {
                        print("rola")
                    }, label: {
                        Label("add", systemImage: "plus")
                    })
                })
            }
        }
    }
    
    
    func filtraEstruturas() {
        for estruturaCESP in estruturasCESP {
            
           
//            if(estruturaCESP.id_cesp == id_cesp) {
                self.listaEstruturas.append(estruturaCESP)
//            }
        }
    }
}

struct estruturasCespView_Previews: PreviewProvider {
    static var previews: some View {
        estruturasCespView(id_cesp: .constant(UUID()), nome_cesp: .constant("CE"))
    }
}
