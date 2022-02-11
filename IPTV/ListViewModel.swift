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
        // your m3u url
        let url = ""
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
