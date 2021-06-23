//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Amit on 2021/05/24.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()

    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil {
                    let jsonDecoder = JSONDecoder()
                    if let safeData = data {
                        do {
                           let results = try  jsonDecoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }catch {
                            debugPrint("Unable to parse JSON")
                        }
                    }
                }else{
                    debugPrint("Error occured")
                }
            }
            task.resume()
        }
    }
}
