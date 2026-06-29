//
//  Home.swift
//  Mist
//
//  Created by Toope Oladunjoye on 6/29/26.
//

import SwiftUI

struct HomeView: View {
    @Binding var percent: Double
    var body: some View {
        let iconName: String = {
            switch percent {
            case ...15:
                return "battery.0"
            case ...25:
                return "battery.25"
            case ...50:
                return "battery.50"
            case ...75:
                return "battery.75"
            default:
                return "battery.100"
            }
        }()
        
        Group {
            VStack {
                HStack {
                    Image(systemName: iconName)
                    Text("\(Int(percent))%")
                }
                .foregroundStyle(percent <= 15 ? .red : .white)
                
                Text(Date().formatted(date: .omitted, time: .shortened)).font(.largeTitle)
                Text(Date().formatted(date: .abbreviated, time: .omitted)).font(.subheadline).foregroundStyle(.secondary)
                
            }
        }
    }
}
