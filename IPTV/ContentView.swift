//
//  ContentView.swift
//  IPTV
//
//  Created by race on 2022/2/11.
//

import Kingfisher
import Player
import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ListViewModel()
    @State private var show = false
    @State private var url: URL?
    let columns = [
        GridItem(.adaptive(minimum: 200))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 60) {
                ForEach(vm.channels, id: \.title) { channel in
                    ZStack {
                        RoundedRectangle(cornerRadius: 50, style: .continuous)
                            .fill(Color(UIColor.hexString("1b1b1b")))
                            .frame(maxWidth: 300, maxHeight: 400)
                        
                        VStack {
                            KFImage.url(URL(string: channel.logo ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fit)

                            Text(channel.title)
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold, design: .rounded))
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                    .padding(.vertical, 10)
                    .onTapGesture(perform: {
                        show = true
                        url = URL(string: channel.url)
                    })
                    .fullScreenCover(isPresented: $show, content: {
                        PlayerView(url: url)
                            .ignoresSafeArea(.all)
                    })
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            vm.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
