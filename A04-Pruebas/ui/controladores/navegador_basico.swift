//
//  navegador_basico.swift
//  A04-Pruebas
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

struct NavegadorBasico: View {
    @Environment(ControladorGeneral.self) var control
    
    init(){
        // Esto ayuda a cambiar el Tab seleccionado Al Color Dorado
        UITabBar.appearance().tintColor = UIColor(named: "JRPGAccent")
        // Esto deja a los tabs no seleccionados de Color Blanco
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "JRPGText")
    }
    
    var body: some View {
        /*
        NavigationStack {
            PantallaBasica()
        }
         */
        ZStack{
            Color.black.ignoresSafeArea()
            
            TabView{
                NavigationStack{
                    PantallaBasica()
                }
                .tabItem{
                    Label("Mensajes", systemImage: "bubble.left.and.bubble.right")
                }
                .badge(control.mensajes.count)
                
                RegistrarUsuario()
                    .tabItem{
                        Label("Add User", systemImage: "person.badge.plus")
                    }
                
                Text("Esta es la pantalla de Inventario")
                    .jrpgWindow()
                    .tabItem{
                        Label("Stuff", systemImage: "backpack")
                    }
                
                Text("Esta es la pantalla de cosas randoms")
                    .jrpgWindow()
                    .tabItem{
                        Label("Map", systemImage: "map")
                    }
            }
            // Esto nos ayuda a asegurar que todos los objetos seleccionables, sean de color Dorado
            .font(.body.monospaced())
            .accentColor(Color("JRPGAccent"))
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NavegadorBasico()
        .environment(ControladorGeneral())
}
