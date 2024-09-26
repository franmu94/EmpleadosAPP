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
    var hint: String
    let validation: (String) -> String?
    
    @State private var isError = false
    
    @State private var error = false
    @State private var errorMsg = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 2) {
            Text(label.capitalized)
                .bold()
                .padding(.bottom, 5)
                .accessibilityHidden(true)
            HStack {
                TextField("Enter the \(label.lowercased())", text: $value)
                    .accessibilityLabel(Text(label))
                    .accessibilityHint(Text(hint))

                Button {
                    value = ""
                } label: {
                    Image(systemName: "xmark")
                        .symbolVariant(.fill)
                        .symbolVariant(.circle)
                }
                .buttonStyle(.plain)
                .opacity(isError ? 0.0 : 0.5)
                .accessibilityLabel(Text("\(label) delete value."))
                .accessibilityHint(Text("Tap this button to delete the value of the field."))
                //.animation(.default, value: editVM.firstName)
            }
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2.0)
                    .fill(.red)
                    .padding(2)
                    .opacity(isError ? 1.0 : 0.0)
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.quaternary)
            }
            Text("First name can not be empty.")
                .font(.caption)
                .foregroundStyle(.red)
                .bold()
                .padding(.horizontal, 10)
                .opacity(isError ? 1.0 : 0.0)
                .accessibilityLabel(Text("\(label) error message."))
                .accessibilityHint(Text("This is an error validation message for the field \(label). Fix the error to continue."))
        }
        .onChange(of: value, initial: false) {
            if let message = validation(value) {
                isError = true
                errorMsg = message
            } else {
                isError = false
                errorMsg = ""
            }
        }
    }
}


#Preview {
    EmpleadoTextField(label: "First Name", value: .constant("Julio"), hint: "") { _ in
        ""
    }
}
