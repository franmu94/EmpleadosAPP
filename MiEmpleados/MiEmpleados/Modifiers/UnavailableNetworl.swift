//
//  UnavailableNetworl.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import SwiftUI

struct UnavailableNetworl: ViewModifier {
    let status: NetworkStatus.Staus
    
    func body(content: Content) -> some View {
        content
            .overlay {
                ZStack{
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    ContentUnavailableView("Nettwork not avaible",
                                           systemImage: "network.slash",
                                           description: Text("There is not internet connection at this moment. this app needs connction in order to work properly. Come back when you have internet"))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .opacity(status == .online ? 0.0 : 1.0)
            }
            .animation(.default, value: status)
    }
}

//#Preview {
//    UnavailableNetworl()
//}

extension View {
    func unavailableNetwork(status: NetworkStatus.Staus) -> some View {
        modifier(UnavailableNetworl(status: status))
    }
}
