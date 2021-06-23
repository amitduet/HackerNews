//
//  WebView.swift
//  HackerNews
//
//  Created by Amit on 2021/05/25.
//

import Foundation
import SwiftUI
import WebKit

struct Webview: UIViewRepresentable{
    
    let urlString:String?
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
        
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
