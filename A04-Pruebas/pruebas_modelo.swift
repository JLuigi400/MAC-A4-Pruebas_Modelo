//
//  ContentView.swift
//  A04-Pruebas
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

struct PruebasModelo: View {
    @State var controlador = ControladorGeneral()
    
    var body: some View {
        NavegadorBasico()
            .environment(controlador )
    }
}
