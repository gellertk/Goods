//
//  NetworkManager.swift
//  Unsplash
//
//  Created by Кирилл  Геллерт on 18.05.2022.
//

import UIKit

protocol Cancellable {
    func cancel()
}

class NetworkService {
    
    static let shared = NetworkService()
    
    private var imageCache = NSCache<NSString, UIImage>()
    
    private weak var task: URLSessionTask?
    
    func fetchData(completion: @escaping (Result<[Good], Error>) -> ()) {
        
        guard let url = URL(string: K.String.api) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let goods = try JSONDecoder().decode([Good].self, from: data)
                completion(.success(goods))
            } catch {
                completion(.failure(error))
            }
        }
        
        dataTask.resume()
    }
    
    func downloadImage(from stringURL: String, completion: @escaping (UIImage?) -> ()) -> Cancellable? {
        
        guard let url = URL(string: stringURL) else {
            return nil
        }
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
            return nil
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            
            var image: UIImage?
            
            defer {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
            
            if let data = data {
                image = UIImage(data: data)
                //self?.imageCache.setObject(image ?? UIImage(), forKey: url.absoluteString as NSString)
            }
            
        }
        
        dataTask.resume()
        self.task = dataTask
        
        return dataTask
    }
    
}

