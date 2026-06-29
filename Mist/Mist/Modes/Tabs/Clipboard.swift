//
//  Clipboard.swift
//  Mist
//
//  Created by Toope Oladunjoye on 6/29/26.
//

import SwiftUI

struct Clipboard: View {
    @State var clipboard: String = ""
    var body: some View {
        ScrollView {
            Text(clipboard)
                .onAppear {
                    getClipboard()
                }
        }
    }
    
    private func getClipboard() {
        if let text = NSPasteboard.general.string(forType: .string) {
            clipboard = text
        }
    }
}

