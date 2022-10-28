import AVKit
import SwiftUI

struct ContentView: View {
    
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            VideoView(viewModel: contentViewModel)
            
            HStack {
                
                Button {
                    contentViewModel.setLocal()
                } label: {
                    Text("Local")
                        .padding([.leading, .trailing], 20)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(20)
                }
                
                Button {
                    contentViewModel.setInternet()
                } label: {
                    Text("Internet")
                        .padding([.leading, .trailing], 20)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(20)
                }
                
            }
            
        }
        .padding()
        /*.onAppear {
            contentViewModel.play()
        }
        .onDisappear {
            contentViewModel.pause()
        }*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
