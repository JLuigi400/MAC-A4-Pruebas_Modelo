//
//  pantalla_detalle_mensaje.swift
//  A04-Pruebas
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

struct PantallaDetalleMensaje: View {
    let mensaje: Mensaje
    
    var body: some View {
        ZStack {
            // Fondo estilo JRPG
            Color("JRPGBackground").ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                // Cabecera con el nombre del usuario
                Text(mensaje.id_usuario!)
                    .font(.custom("Minecraftia", size: 18)) // O .monospaced()
                    .foregroundColor(Color("JRPGAccent")) // Dorado
                
                Divider().background(Color("JRPGBorder"))
                
                // Texto completo del mensaje
                Text(mensaje.texto)
                    .font(.custom("Minecraftia", size: 16))
                    .foregroundColor(Color("JRPGText")) // Blanco
                    .lineLimit(nil) // Asegura que no se corte el texto
                
                Spacer()
            }
            .padding()
            .border(Color("JRPGBorder"), width: 4) // Borde blanco clásico
            .padding()
        }
        .navigationTitle("Mensaje")
        .navigationBarTitleDisplayMode(.inline)
    }
}
