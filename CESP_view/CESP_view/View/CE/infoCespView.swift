//
//  infoCespView.swift
//  CESP_view
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 01/09/22.
//

import SwiftUI

struct infoCespView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @Binding var id_cesp : UUID
    @Binding var nome_cesp : String
    @Binding var endereco_cesp : String
    @Binding var telefone_cesp : String
    @Binding var hf_cesp : String
    @Binding var hf_fds_feriado_cesp : String
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Text("Photo Here")
                Spacer()
            }
            .frame(width: .none, height: CGFloat(200), alignment: .center)
            .background(Color.gray)
            
            //Modifying the name of the Centro Esportivo and the phone icon/map icon to the both stay on the same line
            HStack {
                Text(nome_cesp)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: CGFloat(25), height: CGFloat(25), alignment: .center)
                        .padding()
                })
                .foregroundColor(.black)
            }
            
            
          
            Text("Endereço: \(endereco_cesp)")
          
            Text("Telefone: \(telefone_cesp)")
    
            Text("Horário de Funcionamento: \(hf_cesp)")
            
            Text("Horário de Functionamento Feriado/Fim de semana: \(hf_fds_feriado_cesp)")
            
            Spacer()
            
            NavigationLink(
                destination:
                    estruturasCespView(
                        id_cesp: .constant(id_cesp),
                        nome_cesp: .constant(nome_cesp)),
                label: {
                    Text("Visualizar Estruturas")
                })
            
        }
        .ignoresSafeArea()
    }
}

struct infoCespView_Previews: PreviewProvider {
    static var previews: some View {
        infoCespView(id_cesp: .constant(UUID()), nome_cesp: .constant(""), endereco_cesp: .constant(""), telefone_cesp: .constant(""), hf_cesp: .constant(""), hf_fds_feriado_cesp: .constant(""))
    }
}
