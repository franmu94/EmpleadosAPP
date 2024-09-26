//
//  SaveToolbarButton.swift
//  MiEmpleados
//
//  Created by Fran Malo on 26/9/24.
//

import SwiftUI

struct SaveToolbarButton: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        action()
                    } label: {
                        Text("Save")
                            .bold()
                    }
                    .buttonStyle(.plain)
                    .padding(5)
                    .padding(.horizontal, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(white: 0.9))
                    }
                }
            }
    }
}

extension View {
    func saveToolbarButton(action: @escaping () -> Void) -> some View {
        modifier(SaveToolbarButton(action: action))
    }
}
