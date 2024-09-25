//
//  PreviewViews.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import SwiftUI

extension ContentView {
    static var preview: some View {
        ContentView()
            .environmentObject(EmpleadosVM(interactor: DataTestPreview()))
    }
}
