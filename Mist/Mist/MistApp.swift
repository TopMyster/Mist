//
//  MistApp.swift
//  Mist
//

import SwiftUI
import DynamicNotchKit
import Battery

@main
struct MistApp: App {
    @State private var hovered = false
    @State private var enlarged = false
    @State var status: Bool = false

    var body: some Scene {
        WindowGroup {
            EmptyView()
                .frame(width: 0, height: 0)
                .onAppear {
                    NSApplication.shared.hide(nil)
                    let notch = DynamicNotch(
                        style: .auto,
                        expanded: {
                            NotchView(hovered: $hovered, enlarged: $enlarged, status: $status)
                        },
                        compactLeading: {},
                        compactTrailing: {}
                    )
                    
                    Task {
                        try? await Task.sleep(for: .seconds(0.8))
                        await notch.expand()
                    }
                    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
                        Task { @MainActor in
                            let hovering = notch.isHovering
                            if hovered != hovering {
                                withAnimation(.snappy(duration: 0.5)) {
                                    hovered = hovering
                                }
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
