//
//  ListViewModel.swift
//  IPTV
//
//  Created by race on 2022/2/11.
//

import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var channels: [M3U.Channel] = []
    
    func fetchData() {
        let url = "https://grow-click.oss-cn-hangzhou.aliyuncs.com/img/IPTV.m3u"
        HTTPClient.shared.fetchFromUrl(url) { result in
            switch result {
            case .success(let data):
                let m3u = M3UDecoder().decode(data)
                DispatchQueue.main.async {                
                    self.channels = m3u?.channels ?? []
                }
            case .failure:
                break
            }
        }
    }
}
