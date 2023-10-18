//
//  ChuckJokeModel.swift
//  ChuckJoke
//
//  Created by Daniel Washington Ignacio on 26/09/23.
//

import Foundation

struct ChuckJokeModel {
    var url = "https://api.chucknorris.io/jokes/random"
    
    var delegate: ChuckJokeModelDelegate? 
    
    func fetchJoke(){
        let urlString = url
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let joke = parseJSON(jokeData: safeData){
                        delegate?.didUpdateJoke(joke: joke)
                    }
                }
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(jokeData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(ChuckJokeModelData.self, from: jokeData)
            print(decodeData.value)
            
          
        } catch {
            print(error)
            return nil
        }
        
    }
}
