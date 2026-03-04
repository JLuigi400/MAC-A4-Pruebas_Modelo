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
    @State var nombre: String = ""
    @State var correo: String = ""
    @State var edad: String = ""
    @State var apodo: String = ""
    
    @State var error: ErrorUI? = nil
    
    var body: some View {
        if(error != nil){
            Text("Hay un error, resuelvelo por favor.")
            
        }
        
        VStack{
            //TextField("Nombre: ", text: $nombre)
            CampoTexto(
                entrada: $nombre,
                placeholder: "Nombre",
                error: error,
                id: CampoRegistrarUsuario.nombre.rawValue
            )
            CampoTexto(
                entrada: $apodo,
                placeholder: "Apodo",
                error: error,
                id: CampoRegistrarUsuario.apodo.rawValue
            )
            CampoTexto(
                entrada: $edad,
                placeholder: "Edad",
                error: error,
                id: CampoRegistrarUsuario.edad.rawValue
            )
            CampoTexto(
                entrada: $correo,
                placeholder: "Correo",
                error: error,
                id: CampoRegistrarUsuario.correo.rawValue,
            )
            //TextField("Apodo: ", text: $apodo)
            //TextField("Edad: ", text: $edad)
            //TextField("Correo: ", text: $correo)
            
            Button(action: {
                validar_entradas()
            }){
                
                HStack{
                    Text("Agregar Usuario")
                    Image(systemName: "person.fill.badge.plus")
                }
            }
        }
        .padding()
    }
    
    func validar_entradas(){
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
        
        apodo = ""
        nombre = ""
        edad = ""
        correo = ""
        
        /*
         
         else if(edad.isEmpty){
             error = ErrorUI(
                 campo: "Edad",
                 error: "Tu edad no es claro, ACLARALO", nivel_de_error: .grave_importante
             )
         }
         else if(correo.isEmpty){
             error = ErrorUI(
                 campo: "Correo@Test.com",
                 error: "Correo NO valido, por favor selecciona otro",
                 nivel_de_error: .grave_importante)
         }
         */
        
    }
    
    func crear_usuario() -> Usuario{
        return Usuario(
            nombre: nombre,
            edad: Int (edad)!,
            apodo: apodo,
            email: correo)
    }
}

#Preview {
    RegistrarUsuario()
        .environment(ControladorGeneral())
}
