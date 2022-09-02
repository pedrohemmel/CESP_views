//
//  addNewEstruturaView.swift
//  CESP_view
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 02/09/22.
//

import SwiftUI
import CoreData

struct addNewEstruturaView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @Binding var id_cesp : UUID

    @State var nome_estrutura = ""
    @State var qtd_estrutura = 0
    
    var body: some View {
        Form {
            Section {

                TextField("Nome da estrutura", text: $nome_estrutura)
                    .padding()
                
                TextField("Quantidade da estrutura no local", text: .constant(String(qtd_estrutura)))
                    .padding()
                
                Button(action: {
                    
                    Estrutura_CESPController().addEstrutura_CESP(nome_estrutura: nome_estrutura, id_cesp: 0, qtd_estrutura: Int64(qtd_estrutura), context: managedObjContext)
                    dismiss()
                    
                }, label: {
                    Text("Cadastrar Novo")
                        .padding()
                })
                
            }
        }
    }
}

struct addNewEstruturaView_Previews: PreviewProvider {
    static var previews: some View {
        addNewEstruturaView(id_cesp: .constant(UUID()))
    }
}
