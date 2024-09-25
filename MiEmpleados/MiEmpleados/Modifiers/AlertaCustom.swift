//
//  AlertaCustom.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import SwiftUI

fileprivate struct AlertaCustom: ViewModifier {
    let message: String
    @Binding var showCustom: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                Rectangle()
                    .ignoresSafeArea()
                    .opacity(showCustom ? 0.5 : 0.0)
            }
            .overlay {
                VStack {
                    Text("Employees App Error")
                        .bold()
                    Text(message)
                    Button {
                        showCustom.toggle()
                    } label: {
                        Text("Ok")
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                        .fill(.primary.opacity(0.4))
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .shadow(color: .primary.opacity(0.4), radius: 5, x: 0, y: 5)
                }
                .opacity(showCustom ? 1.0 : 0.0)
                .offset(y: showCustom ? 0 : 200)
            }
            .animation(.bouncy, value: showCustom)
    }
}

extension View {
    func customAlert(message: String, showCustom: Binding<Bool>) -> some View {
        modifier(AlertaCustom(message: message, showCustom: showCustom))
    }
}
