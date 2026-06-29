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
    @State var tab: Int = 1
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
                    EnlargedView(percent: $percent, tab: $tab)
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
            withAnimation(.bouncy(duration: 0.5)) {
                enlarged.toggle()
            }
        }
        .gesture(
            DragGesture(minimumDistance: 15, coordinateSpace: .local)
                .onEnded { value in
                    withAnimation(.snappy(duration: 0.5)) {
                        if value.translation.width > 0 {
                            tab = max(1, tab - 1)
                        } else if value.translation.width < 0 {
                            tab = min(2, tab + 1)
                        }
                    }
                }
        )
    }
    
    func triggerBatteryAlert() {
        Task {
            withAnimation(.bouncy(duration: 0.5)) {
                status = true
                batteryAlert = true
            }
                try? await Task.sleep(for: .seconds(3))
            withAnimation(.bouncy(duration: 0.5)) {
                status = false
                batteryAlert = false
            }
            
        }
    }
}

