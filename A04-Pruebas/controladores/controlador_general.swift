//
//  controlador_general.swift
//  A04-Pruebas
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

@Observable
class ControladorGeneral {
    public var mensajes: [Mensaje]
    
    init(){
        self.mensajes = []
    }
    
    func agregar_mensajes(){
        mensajes += [Mensaje(texto: "Hola, soy un mensaje de: \(mensajes.count + 1)")]
    }
}
