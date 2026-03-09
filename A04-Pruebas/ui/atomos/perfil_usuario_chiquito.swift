//
//  perfil_usuario_chiquito.swift
//  A04-Pruebas
//
//  Created by alumno on 3/6/26.
//

import SwiftUI

struct EtiquetaUsuarioPerfil : View{
    var usuario: Usuario
    
    var body: some View{
        LazyVStack{
            Text("Esta conectado")
                .font(.system(.caption, design: .monospaced))
                .foregroundStyle(Color.white)
                .bold()
            
            ZStack(alignment: .bottom){
                Image("Luigi-Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .border(Color.white, width: 2)
            }
            
            HStack{
                
                Circle()
                    .frame(width: 12)
                    .foregroundStyle(usuario.conectado ? Color.green : Color.red)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 1)
                    )
                    .offset(x: 4, y: 4)
                
                Text ("\(usuario.apodo)")
                    .font(.system(.headline, design: .monospaced))
                    .foregroundColor(Color("JRPGAccent"))
            }
        }
        .padding(20)
        .jrpgWindowStyle()
        .frame(width: 225)
    }
}

#Preview {
    EtiquetaUsuarioPerfil(usuario: usuarios_falsos[0])
}
