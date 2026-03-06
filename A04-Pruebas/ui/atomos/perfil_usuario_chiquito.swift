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
            ZStack(alignment: .bottom){
                Image("Luigi-Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipShape(Circle())
                HStack{
                    Text ("\(usuario.apodo)")
                        .foregroundStyle(Color.green)
                        .font(.headline)
                    Circle()
                        .frame(width: 15)
                        .foregroundStyle(usuario.conectado ? Color.green : Color.red)
                }
                
            }
        }
        .padding(15)
        .background(Color.gray)
        .cornerRadius(15)
        .frame(width: 200)
    }
}

#Preview {
    EtiquetaUsuarioPerfil(usuario: usuarios_falsos[0])
}
