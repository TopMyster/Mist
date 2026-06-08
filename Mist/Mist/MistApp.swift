//
//  MistApp.swift
//  Mist
//

import SwiftUI
import DynamicNotchKit

@main
struct MistApp: App {
    @State private var hovered = false

    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear {
                    let notch = DynamicNotch(
                        style: .auto,
                        expanded: {
                            NotchView(hovered: $hovered)
                        },
                        compactLeading: {},
                        compactTrailing: {}
                    )
                    
                    Task {
                        await notch.expand()
                    }
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                        Task { @MainActor in
                            let hovering = notch.isHovering
                            withAnimation(.snappy(duration: 0.5)) {
                                hovered = hovering
                            }
                        }
                    }
            }
        }
        Settings {
            SettingView()
        }
    }
}
