//
//  GlanceView.swift
//  Mist
//
//  Created by Toope Oladunjoye on 6/8/26.
//

import SwiftUI

struct GlanceView: View {
    var body: some View {
        // Date
        Text(Date().formatted(date: .abbreviated, time: .shortened))
    }
}

#Preview {
    GlanceView()
}
