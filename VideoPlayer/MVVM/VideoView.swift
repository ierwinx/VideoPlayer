import AVKit
import SwiftUI
import Foundation

struct VideoView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = AVPlayerViewController
    
    @ObservedObject var viewModel: ContentViewModel
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let vc = AVPlayerViewController()
        vc.player = viewModel.player
        vc.canStartPictureInPictureAutomaticallyFromInline = true
        return vc
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }

}
