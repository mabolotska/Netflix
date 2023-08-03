//
//  APICaller.swift
//  Netflix
//
//  Created by Maryna Bolotska on 03/08/23.
//

import Foundation


struct Constants {
    static let API_KEY = "8584f8073b689b2bc0540fe12372311c"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    

    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
            guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }

                do {
                    let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                    completion(.success(results.results))

                } catch {
                    completion(.failure(error))
                }
            }

            task.resume()
        }
}
