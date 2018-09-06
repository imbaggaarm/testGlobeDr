//
//  Config.swift
//  TestRestfulApiApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import Foundation

class Config {
    class API {
        static let BASE_URL: String = "https://your_base_url.com/api/" // replace your base url here
        static let version = 0 // replace your version here
    }
}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
