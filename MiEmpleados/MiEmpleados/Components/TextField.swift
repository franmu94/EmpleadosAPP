//
//  TextField.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import SwiftUI

struct EmpleadoTextField: View {
    let label: String
    @Binding var value: String
    let validation: (String) -> Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label.capitalized)
                .bold()
            HStack {
                TextField("Enter the \(label.lowercased())", text: $value)
                Button {
                    value = ""
                } label: {
                    Image(systemName: "xmark")
                        .symbolVariant(.fill)
                        .symbolVariant(.circle)
                }
                .buttonStyle(.plain)
                .opacity(validation(value) ? 0.0 : 0.5)
                //.animation(.default, value: editVM.firstName)
            }
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2.0)
                    .fill(.red)
                    .padding(2)
                    .opacity(validation(value) ? 1.0 : 0.0)
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.quaternary)
            }
            if validation(value) {
                Text("First name can not be empty.")
                    .font(.caption)
                    .foregroundStyle(.red)
                    .bold()
                    .padding(.horizontal, 10)
            }
        }
        .padding(.vertical, 10)
    }
}


#Preview {
    EmpleadoTextField(label: "First Name", value: .constant("Julio")) { _ in
        true
    }
}
