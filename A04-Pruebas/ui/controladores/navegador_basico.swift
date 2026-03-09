//
//  navegador_basico.swift
//  A04-Pruebas
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

struct NavegadorBasico: View {
    @Environment(ControladorGeneral.self) var control
    
    var body: some View {
        /*
        NavigationStack {
            PantallaBasica()
        }
         */
        TabView {
            
            Tab("Mensajes", systemImage: "bubble.left.and.bubble.right"){
                NavigationStack {
                    PantallaBasica()
                }
            }
            .badge(control.mensajes.count)

            
            Tab("Agregar User", systemImage: "person.badge.plus"){
                RegistrarUsuario()
            }
            
            Tab("Stuffs", systemImage: "backpack"){
                Text("Esta es la pantalla de inventario")
            }
            
            Tab("Contact", systemImage: "map"){
                Text("Esta es la pantalla de cosas randoms")
            }
            
        }
    }
}

#Preview {
    NavegadorBasico()
        .environment(ControladorGeneral())
}
