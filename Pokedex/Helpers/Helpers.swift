//
//  Helpers.swift
//  Pokedex
//
//  Created by Kinzo on 3/5/25.
//

import Foundation

extension Bundle {
    func decode<T:Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("cannot find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("cannot read \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("cannot decode (\(file)) in bundle.")
        }
        
        return loadedData
    }
    
    func fetchData<T:Decodable>(url: String, model : T.Type, completion:@escaping(T) -> (), failure:@escaping(Error)->()){
        guard let url = URL(string: url) else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error{
                    print(error)
                    failure(error)
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(model, from: data)
                completion(decodedData)
            }catch{
                failure(error)
            }
        }.resume()
    }
}
