//
//  NotchView.swift
//  Mist
//
//  Created by Toope Oladunjoye on 6/7/26.
//

import SwiftUI

struct NotchView: View {
    @Binding var hovered: Bool
    @State var status: Bool = false
    var body: some View {
        if hovered {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button("Status") {
                status.toggle()
            }
        } else {
            if status {
                StatusView(status: $status)
                    .frame(width: 250)
            } else {
                EmptyView()
            }
        }
    }
}

