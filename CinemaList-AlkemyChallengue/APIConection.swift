//
//  APIConection.swift
//  CinemaList-AlkemyChallengue
//
//  Created by Ivan Romero on 01/04/2022.
//

import Foundation
import Alamofire

struct APIConection {
    
    static let shared = APIConection()
    
   
    let keyMovieURL = ProcessInfo.processInfo.environment["KEY"]
    
    
    func getMovies (sucess: @escaping (_ movie: Results)->(), failure: @escaping (_ error: Error?)->()){
        
        let movieURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(keyMovieURL!)"
        
        AF.request(movieURL, method: .get).responseDecodable (of: Results.self) { response in
            
            if let results = response.value {
                sucess(results)
            } else {
                failure(response.error)
            }
            
        }
                   
    }
    
    
}
