//
//  Extension+Alamofire.swift
//
//
//  Created by Anthony on 6/8/2018.
//  Copyright © 2018年 AntmanTech. All rights reserved.
//

import Alamofire

extension Alamofire.SessionManager {
    @discardableResult
    open func requestWithoutCache(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest?
    {
        do {
            var urlRequest = try URLRequest(url: url, method: method, headers: headers)
            urlRequest.cachePolicy = .reloadIgnoringCacheData // <<== Cache disabled
            let encodedURLRequest = try encoding.encode(urlRequest, with: parameters)
            return request(encodedURLRequest)
        } catch {
            print(error)
            return nil
        }
    }
}
