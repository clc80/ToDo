//
//  NetworkService.swift
//  ToDo
//
//  Created by Claudia Maciel on 2/27/21.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    let URL_BASE = "http://localhost:3003"
    let URL_ADD_TODO = "/add"
    
    let session = URLSession(configuration: .default)
    
    func getTodos(onSucces: @escaping (ToDos) -> Void) {
        let url = URL(string: "\(URL_BASE)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                return
            }
            
            guard let data = data,
                  let response = response as? HTTPURLResponse else {
                debugPrint("Invalid data or response")
                return
            }
            do {
                if response.statusCode == 200 {
                    let items = try JSONDecoder().decode(ToDos.self, from: data)
                    print(items)
                } else {
                    let err = try JSONDecoder().decode(APIError.self, from: data)
                }
            } catch {
                debugPrint(error.localizedDescription)
            }
            
            
            
        }
        task.resume()
    }
    
    func addTodo(todo: ToDo) {
        
    }
    
}
