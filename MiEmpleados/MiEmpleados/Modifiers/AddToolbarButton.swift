//
//  AddToolbarBottun.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import SwiftUI


struct AddToolbarButton: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        action()
                    } label: {
                        Image(systemName: "plus")
                            .symbolVariant(.circle)
                            .symbolVariant(.fill)
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
    func addToolBarButton(action: @escaping () -> Void) -> some View {
        modifier(AddToolbarButton(action: action))
    }
}
