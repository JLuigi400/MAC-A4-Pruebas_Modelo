//
//  estilo_global.swift
//  A04-Pruebas
//
//  Created by alumno on 3/9/26.
//

import SwiftUI

struct JRPGWindowStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .background(Color("JRPGBackground"))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color("JRPGBorder"), lineWidth: 3)
            )
            .padding(2)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
    }
}

extension View{
    func jrpgWindowStyle() -> some View{
        self.modifier(JRPGWindowStyle())
    }
}
