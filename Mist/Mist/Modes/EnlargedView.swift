//
//  EnlargedView.swift
//  Mist
//
//  Created by Toope Oladunjoye on 6/8/26.
//

import SwiftUI

struct EnlargedView: View {
    @Binding var percent: Double
    @Binding var tab: Int 
    var body: some View {
        Group {
            switch tab {
            case 1:
                HomeView(percent: $percent)
            case 2:
                Clipboard()
            default:
                HomeView(percent: $percent)
            }
        }
    }
}

