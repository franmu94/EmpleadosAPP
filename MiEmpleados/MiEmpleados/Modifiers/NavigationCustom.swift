//
//  NavigationCustom.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import SwiftUI

fileprivate struct NavigationCustom: ViewModifier {
    let title: String
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text(title)
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                }
//                ToolbarItem(placement: .primaryAction) {
//                    Button {
//                        
//                    } label: {
//                        Image(systemName: "plus")
//                            .symbolVariant(.circle)
//                            .symbolVariant(.fill)
//                    }
//                    .buttonStyle(.plain)
//                    .padding(5)
//                    .padding(.horizontal, 10)
//                    .background {
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color(white: 0.9))
//                    }
//                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear {
                UINavigationBar.appearance().backgroundColor = .red
            }
    }
}

extension View {
    func customNavBar(title: String) -> some View {
        modifier(NavigationCustom(title: title))
    }
}
