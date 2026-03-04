//
//  campo.swift
//  A04-Pruebas
//
//  Created by alumno on 3/4/26.
//

import SwiftUI

struct CampoTexto: View {
    @Binding var entrada: String
    var placeholder: String
    
    var error: ErrorUI?
    var id: String
    
    var body: some View {
        TextField(placeholder, text: $entrada)
        
        if(error?.campo == placeholder){
            switch error!.nivel_de_error {
                case .grave_importante:
                    Text(error!.error)
                        .foregroundStyle(Color.red)
                
                case .medio_advertencia:
                    Text(error!.error)
                        .foregroundStyle(Color.yellow)
                case .leve_informativo:
                    Text(error!.error)
                        .foregroundStyle(Color.gray)
            }
        }
    }
}
