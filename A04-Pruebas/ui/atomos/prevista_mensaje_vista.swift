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
            Image(systemName: "message")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
            
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Text("\(mensaje.id_usuario ?? "Anonimo" )")
                        .background(Color.blue)
                }
                .background(Color.cyan)
                
                Text("\(mensaje.texto)")
                    .background(Color.yellow)
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding()
        .frame(height: 100)
        .overlay{
            RoundedRectangle(cornerRadius: 25, style: .circular)
                .stroke(.black, lineWidth: 5)
        }
        .padding(20)
    }
}

#Preview {
    PrevistaMensaje(mensaje: mensajes_falsos[0])
}
