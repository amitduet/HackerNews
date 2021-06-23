//
//  PostData.swift
//  HackerNews
//
//  Created by Amit on 2021/05/24.
//

import Foundation

struct Results:Decodable {
    let hits:[Post]
}

struct Post:Decodable, Identifiable {
    var id:String {
        return objectID
    }
    let objectID:String
    let points:Int
    let title:String
    let author:String
    let url:String?
}
