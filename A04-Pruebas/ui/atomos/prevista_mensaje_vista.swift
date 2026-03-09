//
//  prevista_mensaje_vista.swift
//  A04-Pruebas
//
//  Created by alumno on 3/6/26.
//

import SwiftUI

struct PrevistaMensaje: View {
    var mensaje: Mensaje
    
    var body: some View {
        HStack{
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(4)
                .background(Color("JRPGBackground"))
                .border(Color("JRPGBorder"), width: 2)
                .foregroundStyle(Color("JRPGText"))
            
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Text("\(mensaje.id_usuario ?? "Anonimo" )")
                        .font(.system(.caption, design: .monospaced))
                        .bold()
                        .foregroundStyle(Color("JRPGAccent"))
                }
                
                Text("\(mensaje.texto)")
                    .font(.system(.caption, design: .monospaced))
                    .foregroundStyle(Color("JRPGText"))
            }
            .padding(.horizontal)
            .jrpgWindow()
            Spacer()
        }
        .padding()
        .frame(height: 100)
        .overlay{
            RoundedRectangle(cornerRadius: 25, style: .circular)
                .stroke(.black, lineWidth: 5)
        }
        .padding(20)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    PrevistaMensaje(mensaje: mensajes_falsos[0])
}
