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
                    EmpleadoTextField(label: "Adress", value: $editVM.address, hint: AccessibilityHints.address, validation: editVM.fieldIsEmpty)
                        .textContentType(.fullStreetAddress)
                    EmpleadoTextField(label: "ZIP Code", value: $editVM.address, hint: AccessibilityHints.zipcode, validation: editVM.fieldIsEmpty)
                        .textContentType(.postalCode)
                    HStack {
                        Text("Gender")
                            .bold()
                            .accessibilityHidden(true)
                        Spacer()
                        Picker(selection: $editVM.gender) {
                            ForEach(Gender.allCases) { gender in
                               Text(gender.rawValue)
                                    .tag(gender.rawValue)
                            }
                        } label: {
                            Text("Gender")
                        }
                    }
                }
                header: {
                    Text("Personal data")
                        .textCase(.uppercase)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 10)
                }
                Section {
                    EmpleadoTextField(label: "Email", value: $editVM.email, hint: AccessibilityHints.email, validation: editVM.emailIsNotValid)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    EmpleadoTextField(label: "Username", value: $editVM.username, hint: AccessibilityHints.username, validation: editVM.usernameValidation)
                        .textContentType(.username)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    HStack {
                        Text("Department")
                            .bold()
                            .accessibilityHidden(true)
                        Spacer()
                        Picker(selection: $editVM.department) {
                            ForEach(DptoName.allCases) { depa in
                               Text(depa.rawValue)
                                    .tag(depa.rawValue)
                            }
                        } label: {
                            Text("Department")
                        }
                    }
                }
                header: {
                    Text("Personal data")
                        .textCase(.uppercase)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .padding(.vertical)
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
