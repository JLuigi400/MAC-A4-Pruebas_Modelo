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
        
        ForEach(controlador.mensajes){ mensaje in
            NavigationLink{
                Text("Esta es la pantalla del \(mensaje.texto)")
            }
            
            label: {
                Text ("Aqui pulsarás para ir a ver el mensaje: \(mensaje.texto)")
            }
            .onAppear{
                print("Buenos dias, so la vista de: \(mensaje)")
            }
        }
        
        Spacer()
        
        Text("Agregaremos un HOLA MUNDO")
            .onTapGesture {
                controlador.agregar_mensajes()
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
