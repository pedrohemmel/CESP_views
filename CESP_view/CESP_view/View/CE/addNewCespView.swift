//
//  addNewCespView.swift
//  CESP_view
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 30/08/22.
//

import SwiftUI

struct addNewCespView: View {
    
    //Variables that is going to controll the view of the page
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    
    @State private var nome_cesp = ""
    @State private var endereco_cesp = ""
    @State private var telefone_cesp = ""
    @State private var hf_cesp = ""
    @State private var hf_fds_feriado_cesp = ""
    
    
    var body: some View {
        Form {
            Section {
                TextField("Nome CESP", text: $nome_cesp)
                    .padding()
                
                TextField("Endereço CESP", text: $endereco_cesp)
                    .padding()
                
                TextField("Telefone CESP", text: $telefone_cesp)
                    .padding()
                
                TextField("Horário de funcionamento", text: $hf_cesp)
                    .padding()
                
                TextField("Horário de funcionamento Final de semana/Feriado", text: $hf_fds_feriado_cesp)
                    .padding()
                
                Button(action: {
                    
                    CESPController().addCESP(nome_cesp: self.nome_cesp, endereco_cesp: self.endereco_cesp, telefone_cesp: self.telefone_cesp, hf_cesp: self.hf_cesp, hf_feriado_fds_cesp: self.hf_fds_feriado_cesp, context: self.managedObjContext)
                    dismiss()
                    
                }, label: {
                    Text("Cadastrar Novo")
                        .padding()
                })
                
            }
        }
    }
}

struct addNewCespView_Previews: PreviewProvider {
    static var previews: some View {
        addNewCespView()
    }
}
