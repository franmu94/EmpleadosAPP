//
//  EditEmpleado.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import SwiftUI

struct EditEmpleadoView: View {
    @ObservedObject var editVM: EditEmpleadosVM
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Section {
                    EmpleadoTextField(label: "First Name", value: $editVM.firstName, hint: AccessibilityHints.firstName, validation: editVM.fieldIsEmpty)
                        .textContentType(.name)
                    EmpleadoTextField(label: "Last Name", value: $editVM.lastName, hint: AccessibilityHints.lastName, validation: editVM.fieldIsEmpty)
                        .textContentType(.middleName)
                    EmpleadoTextField(label: "Email", value: $editVM.email, hint: AccessibilityHints.email, validation: editVM.emailIsNotValid)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    EmpleadoTextField(label: "Username", value: $editVM.username, hint: AccessibilityHints.username, validation: editVM.emailIsNotValid)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                header: {
                    Text("Personal data")
                        .textCase(.uppercase)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 10)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
        .customNavBar(title: "Edit Employee")
        .addToolBarButton {
            print("")        }
    }
}

#Preview {
    NavigationStack {
        EditEmpleadoView(editVM: EditEmpleadosVM(empleado: .test))
    }
}
