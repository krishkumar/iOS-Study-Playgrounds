import UIKit
import PlaygroundSupport
// Add your code below.

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        Text("hello, playgroundui")
    }
}


let host = UIHostingController(rootView: ContentView())
host.view.bounds = CGRect(x: 0, y: 0, width: 375, height: 812)

PlaygroundPage.current.setLiveView(host)


PlaygroundPage.current.needsIndefiniteExecution = true

