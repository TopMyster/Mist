//
//  NotchView.swift
//  Mist
//
//  Created by Toope Oladunjoye on 6/7/26.
//

import SwiftUI
import Battery

struct NotchView: View {
    @Binding var hovered: Bool
    @Binding var enlarged: Bool
    @Binding var status: Bool
    @State var percent: Double = -1.0
    @State var batteryAlert: Bool = false
 
    
    @StateObject private var battery = Battery()
    var body: some View {
        Group {
            StatusView(percent: $percent, batteryAlert: $batteryAlert)
                .frame(width: status ? 250 : 0)
                .clipped()
                .opacity(status ? 1 : 0)
                    
            if hovered {
                if enlarged {
                    //Enlarged Elements
                    EnlargedView(percent: $percent)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 70)
                } else {
                    //Hovered Elements
                    GlanceView()
                }
            }
        }
        .onChange(of: hovered) {
            enlarged = false
        }
        .onReceive(battery.$percentage) { perc in
            percent = Double(perc)
        }.onChange(of: percent) { _, newPercent in
            if newPercent == 15 && newPercent == 5 && newPercent == 3 && !status {
                triggerBatteryAlert()
            }
        }
        .onTapGesture {
            withAnimation(.snappy(duration: 0.5)) {
                enlarged.toggle()
            }
        }
    }
    
    func triggerBatteryAlert() {
        Task {
            withAnimation(.snappy(duration: 0.5)) {
                status = true
                batteryAlert = true
            }
                try? await Task.sleep(for: .seconds(3))
            withAnimation(.snappy(duration: 0.5)) {
                status = false
                batteryAlert = false
            }
            
        }
    }
}

