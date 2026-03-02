//
//  registrar_usuario_pantalla.swift
//  A04-Pruebas
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

struct RegistrarUsuario: View {
    @State var nombre: String
    @State var correo: String
    @State var edad: String
    @State var apodo: String
    
    var body: some View {
        TextField("Nombre: ", text: $nombre)
    }
}
