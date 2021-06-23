//
//  ContentView.swift
//  HackerNews
//
//  Created by Amit on 2021/05/23.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                
                NavigationLink(destination: DetailsView(url: post.url))
                {
                    Text(String(post.points))
                    Text(post.title)
                }
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear(perform:
                    self.networkManager.fetchData
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
