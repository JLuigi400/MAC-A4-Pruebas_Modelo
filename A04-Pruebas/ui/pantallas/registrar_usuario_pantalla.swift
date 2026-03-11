//
//  registrar_usuario_pantalla.swift
//  A04-Pruebas
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

enum CampoRegistrarUsuario: String{
    case nombre = "nombre"
    case apodo = "apodo"
    case edad = "edad"
    case correo = "correo"
}

struct RegistrarUsuario: View {
    @Environment(ControladorGeneral.self) var controlador
    @Environment(\.dismiss) var salir
    
    @State var nombre: String = ""
    @State var correo: String = ""
    @State var edad: String = ""
    @State var apodo: String = ""
    
    @State var error: ErrorUI? = nil
    
    var body: some View {
        
        ZStack{
            // 1. Iniciamos con el fondo negro
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20){
                // Titulo de Pantalla Estilo Dragon Quest 1
                Text("REGISTRO DE HÉROE")
                    .font(.system(.headline, design: .monospaced))
                    .foregroundStyle(Color("JRPGAccent"))
                    .padding(.bottom, 20)
                
                if let error = error{
                    Text("¡ERROR! : \(error.error)")
                        .font(.system(.headline, design: .monospaced))
                        .foregroundStyle(Color.red)
                        .jrpgWindow()
                }
                
                // 2. Agrupacion de la ventana principal para mostrar al usuario
                
                VStack{
                    // Nombre del usuario
                    CampoTexto(
                        entrada: $nombre,
                        placeholder: "Nombre del Usuario",
                        error: error,
                        id: CampoRegistrarUsuario.nombre.rawValue)
                    // Apodo del usuario
                    CampoTexto(
                        entrada: $apodo,
                        placeholder: "Apodo del Usuario",
                        error: error,
                        id: CampoRegistrarUsuario.apodo.rawValue
                    )
                    // Edad del usuario
                    CampoTexto(
                        entrada: $edad,
                        placeholder: "Edad",
                        error: error,
                        id: CampoRegistrarUsuario.edad.rawValue
                    )
                    // Correo del usuario
                    CampoTexto(
                        entrada: $correo,
                        placeholder: "Correo",
                        error: error,
                        id: CampoRegistrarUsuario.correo.rawValue
                    )
                }
                .jrpgWindow()
                
                // 3. Botón de acción
                Button(action: {
                validar_entrada()
                }){
                    HStack{
                        Text(">")
                        Text("Agregar Usuario")
                        Image(systemName: "person.fill.badge.plus")
                    }
                    .font(.system(.body, design: .monospaced))
                    .foregroundStyle(Color.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.jrpgBorder, lineWidth: 1)
                    )
                }
            }
            .padding()
        }
    }
    
    // Logica de funciones
    func validar_entrada(){
        if(nombre.isEmpty){
            error = ErrorUI(
                campo: CampoRegistrarUsuario.nombre.rawValue,
                error: "No tienes nombre WEBON",
                nivel_de_error: .grave_importante
            )
            
            return
        }
        if(apodo.isEmpty){
            error = ErrorUI(
                campo: CampoRegistrarUsuario.apodo.rawValue,
                error: "Apodo NO valido, por favor selecciona otro",
                nivel_de_error: .grave_importante
            )
            return
        }
        
        controlador.agregar_usuario(crear_usuario())
        salir() //Esta es la opcion de Salir de la ventana
        
        apodo = ""
        nombre = ""
        edad = ""
        correo = ""
    }
      
    
    func crear_usuario() -> Usuario{
        return Usuario(
            nombre: nombre,
            edad: Int (edad) ?? 0,
            apodo: apodo,
            email: correo)
    }
}

#Preview {
    RegistrarUsuario()
        .environment(ControladorGeneral())
}
