//
//  pantalla_basica.swift
//  A04-Pruebas
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

struct PantallaBasica: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        Text("Esta pantalla me mueve a la siguiente Opción")
        
        Spacer()
        ScrollView(.horizontal){
            LazyHStack{
                ForEach(controlador.usuarios){ usuario in
                    NavigationLink{
                        //Text("Esta es la pantalla del \(usuario.id)")
                        PantallaPerfilUsuario(usuario: usuario)
                    }
                    
                    label: {
                        EtiquetaUsuarioPerfil(usuario: usuario)
                    }
                }
            }
        }
        Spacer()
        ScrollView{
            ForEach(controlador.mensajes){ mensaje in
                NavigationLink{
                    Text("Esta es la pantalla de  \(mensaje.id_usuario)")
                }
                
                label: {
                    PrevistaMensaje(mensaje: mensaje)
                }
            }
        }
        
        Text("Agregaremos un HOLA MUNDO")
            .onTapGesture {
                controlador.agregar_mensajes()
            }
        
        NavigationLink{
            RegistrarUsuario()
        }
        
        label: {
            Text("Agregar Usuario")
        }
        Spacer()
    }
}

#Preview {
    NavigationStack {
        PantallaBasica()
    }
    .environment(ControladorGeneral())
}
