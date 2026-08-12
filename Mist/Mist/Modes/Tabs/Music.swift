//
//  Music.swift
//  Mist
//
//  Created by Toope Oladunjoye on 8/12/26.
//

import SwiftUI

struct Music: View {
    @State private var track = ""
    var body: some View {
        VStack {
            Text(track.isEmpty ? "No song playing" : track)
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        track = NowPlaying()
                    }
                }
            HStack(spacing: 1) {
                Button("Play and Pause") {
                    NSAppleScript(source: "tell application \"Spotify\" to playpause")?.executeAndReturnError(nil)
                }
                
                Button("Next") {
                    NSAppleScript(source: "tell application \"Spotify\" to next track")?.executeAndReturnError(nil)
                }
                
                Button("Previous") {
                    NSAppleScript(source: "tell application \"Spotify\" to previous track")?.executeAndReturnError(nil)
                }
            }
        }
    }
    
    func NowPlaying() -> String {
        let src = """
        tell application "Spotify"
            if it is running then return (name of current track) & " - " & (artist of current track)
        end tell
        """
        
        return NSAppleScript(source: src)?.executeAndReturnError(nil).stringValue ?? ""
    }
}

#Preview {
    Music()
}
