//
//  NewsDataStruct.swift
//  APIpractice
//
//  Created by Shivakumar Harijan on 01/04/24.
//

import Foundation
struct NewsDataStruct: Codable {
    let status: String
    let articles: [articalDataStruct]
}
