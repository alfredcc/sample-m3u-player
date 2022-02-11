//
//  PlayerPreview.swift
//  IPTV
//
//  Created by race on 2022/2/11.
//

import SwiftUI


struct PlayerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some PlayerViewController {
        let vc = PlayerViewController()
        vc.videoUrl = url
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    @State var url: URL?
   
}
