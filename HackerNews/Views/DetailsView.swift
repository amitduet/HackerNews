//
//  DetailsView.swift
//  HackerNews
//
//  Created by Amit on 2021/05/25.
//

import SwiftUI

struct DetailsView: View {
    let url:String?
    
    var body: some View {
        Webview(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://www.google.com")
    }
}
