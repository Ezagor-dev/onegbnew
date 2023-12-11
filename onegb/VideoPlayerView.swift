//
//  VideoPlayerView.swift
//  onegb
//
//  Created by Ezagor on 11.12.2023.
//

import SwiftUI

import AVKit

struct VideoPlayerView: View {
    private let videoURL = Bundle.main.url(forResource: "Animasyon_1", withExtension: "mp4") // Replace with your MP4 file name and extension

    var body: some View {
        VStack {
            if let videoURL = videoURL {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .frame(height: 300) // Adjust the frame size as needed
            } else {
                Text("Video file not found.")
            }
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
