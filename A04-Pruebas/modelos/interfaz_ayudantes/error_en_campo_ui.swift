//
//  error_en_campo_ui.swift
//  A04-Pruebas
//
//  Created by alumno on 3/4/26.
//

enum NivelesDeError: String, Codable {
    case grave_importante
    case medio_advertencia
    case leve_informativo
}

struct ErrorUI{
    let campo: String
    let error: String
    let nivel_de_error: NivelesDeError
}
