//
//  EnlargedView.swift
//  Mist
//
//  Created by Toope Oladunjoye on 6/8/26.
//

import SwiftUI

struct EnlargedView: View {
    var body: some View {
        Group {
            VStack {
                HStack {
                    
                }
                Text(Date().formatted(date: .omitted, time: .shortened)).font(.largeTitle)
                Text(Date().formatted(date: .abbreviated, time: .omitted)).font(.subheadline).foregroundStyle(.secondary)
                
            }
        }
    }
}

#Preview {
    EnlargedView()
}
