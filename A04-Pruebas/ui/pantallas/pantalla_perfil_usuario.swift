//
//  pantalla_perfil_usuario.swift
//  A04-Pruebas
//
//  Created by alumno on 3/11/26.
//

import SwiftUI

struct PantallaPerfilUsuario: View {
    let usuario: Usuario
    
    // Función para buscar el mensaje que pertenece a este usuario
       var mensajeDelUsuario: String {
           mensajes_falsos.first(where: { $0.id_usuario == usuario.apodo })?.texto
           ?? "¡Un héroe de pocas palabras!"
       }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // Fondo oscuro RPG
            
            VStack(spacing: 25) {
                // Título superior estilizado
                Text("ESTADO DEL HÉROE")
                    .font(.system(.title3, design: .monospaced))
                    .foregroundColor(Color("JRPGAccent")) // Dorado
                    .padding(.top)

                // Ventana de Retrato (Avatar)
                VStack {
                    Image("Luigi-Icon") // Aquí iría la foto
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.top)
                    
                    Text(usuario.apodo)
                        .font(.system(.headline, design: .monospaced))
                        .foregroundColor(.white)
                }
                .padding()
                .jrpgWindow() // Usamos tu modificador de doble borde

                // Ventana de Estadísticas / Contacto
                VStack(alignment: .leading, spacing: 15) {
                    LabelValor(label: "NOMBRE:", valor: usuario.nombre)
                    LabelValor(label: "EDAD:", valor: "\(usuario.edad) AÑOS")
                    LabelValor(label: "CONTACTO:", valor: usuario.email)
                    
                    HStack {
                        Text("ESTADO:")
                        Text(usuario.conectado ? "EN LINEA" : "AUSENTE")
                            .foregroundColor(usuario.conectado ? .green : .gray)
                    }
                    .font(.system(.body, design: .monospaced))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .jrpgWindow()
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(mensajeDelUsuario)
                        .font(.system(.body, design: .monospaced))
                        .foregroundStyle(Color("JRPGText"))
                        .lineSpacing(5)
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
                .jrpgWindow() // Tu modificador de ventana negra
            }
            .padding()
        }
        .navigationTitle(usuario.apodo)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Sub-vista para mantener el código limpio
struct LabelValor: View {
    let label: String
    let valor: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(Color("JRPGAccent"))
            Text(valor)
                .foregroundColor(.white)
        }
        .font(.system(.body, design: .monospaced))
    }
}

#Preview {
    PantallaPerfilUsuario(usuario: usuarios_falsos[0])
}
