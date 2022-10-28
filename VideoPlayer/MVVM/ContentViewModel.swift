import AVKit
import Combine
import Foundation

class ContentViewModel: ObservableObject {

    @Published private var media = Bundle.main.url(forResource: "IMG_2483", withExtension: "MOV")!
    
    let player = AVPlayer()
    private var cancellable: AnyCancellable?
    
    init() {
        setAudioSessionCategory(to: .playback)
        cancellable = $media.sink(receiveValue: { [weak self] url in
            guard let self = self else { return }
            self.player.replaceCurrentItem(with: AVPlayerItem(url: url))
        })
    }
    
    func setLocal() {
        player.pause()
        guard let url = Bundle.main.url(forResource: "IMG_2483", withExtension: "MOV") else { return }
        media = url
        player.play()
    }
    
    func setInternet() {
        player.pause()
        guard let url = URL(string: "https://media3.giphy.com/media/L3Cg065zbng8M674fj/giphy1080p.mp4") else { return }
        media = url
        player.play()
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
    
    private func setAudioSessionCategory(to value: AVAudioSession.Category) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
           try audioSession.setCategory(value)
        } catch let e {
            debugPrint("Error setCategory")
            debugPrint(e)
        }
    }
    
}
