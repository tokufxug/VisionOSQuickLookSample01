//
//  ContentView.swift
//  VisionOSQuickLookSample01
//
//  Created by Sadao Tokuyama on 5/10/24.
//

import SwiftUI
import QuickLook

struct ContentView: View {

    @State var previewURL: URL?
    @State var dragAndDropURL: URL?
    
    var body: some View {
        VStack(spacing: 60) {
            Text("Drag & Drop")
            .font(.extraLargeTitle2)
                .padding()
                .background(.red)
                .cornerRadius(10)
                .hoverEffect()
                .onDrag {
                    dragAndDropURL = Bundle.main.url(forResource: "hab_en", withExtension: "reality")!
                    return NSItemProvider(contentsOf: dragAndDropURL) ?? NSItemProvider()
                }
            
            Button(action: {
                previewURL = Bundle.main.url(forResource: "pancakes", withExtension: "usdz")!
            }) {
                Text("Preview")
                    .font(.extraLargeTitle2)
                    .padding()
                    .cornerRadius(10)
            }
        }
        .quickLookPreview($previewURL)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
