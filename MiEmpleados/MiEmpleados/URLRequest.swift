//
//  URLRequest.swift
//  MiEmpleados
//
//  Created by Fran Malo on 22/5/24.
//

import Foundation

enum HTTPMEthod: String {
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

extension URLRequest {
    static func get(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = 60
        request.httpMethod = "GET"
        request.setValue("aplication/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    static func post<JSON>(url: URL, post: JSON, method: HTTPMEthod = .post) -> URLRequest where JSON: Codable {
        var request = URLRequest(url: url)
        request.timeoutInterval = 60
        request.httpMethod = method.rawValue
        request.httpBody = try? JSONEncoder().encode(post)
        request.setValue("aplication/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("aplication/json", forHTTPHeaderField: "Accept")

        return request
    }
}


