//
//  MovieModel.swift
//  CinemaList-AlkemyChallengue
//
//  Created by Ivan Romero on 01/04/2022.
//

import Foundation

struct Results:Decodable {
    
    let results: [MovieResults]
    
}

struct MovieResults:Decodable {
    
    let original_title: String
    let backdrop_path: String
    let release_date: String
    
}

