//
//  jrpg_window_modify.swift
//  A04-Pruebas
//
//  Created by alumno on 3/9/26.
//

import SwiftUI

struct JRPGWindowModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 3)
            )
            .padding(4)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 1)
            )
    }
}

extension View {
    func jrpgWindow() -> some View {
        self.modifier(JRPGWindowModifier())
    }
}
