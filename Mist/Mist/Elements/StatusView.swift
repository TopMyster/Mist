//
//  StatusView.swift
//  Mist
//
//  Created by Toope Oladunjoye on 6/8/26.
//

import SwiftUI
import Battery

struct StatusView: View {
    @Binding var percent: Double
    @Binding var batteryAlert: Bool
    var body: some View {
        //Percent
        if batteryAlert {
            HStack {
                Text("Low Battery")
                Spacer()
                HStack {
                    Text("\(Int(percent))%")
                    Image(systemName: "battery.25percent")
                        .font(.custom("battery", size: 20))
                }
                .foregroundStyle(.red)
            }
        } else {
            EmptyView()
        }
    }
}

