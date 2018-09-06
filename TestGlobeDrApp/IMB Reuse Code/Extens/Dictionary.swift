//
//  Dictionary.swift
//  TestRestfulApiApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import Foundation

extension Dictionary
{
    func convertDicToParamType() -> String
    {
        var resultString = ""
        for (index, i) in self.enumerated()
        {
            if index == 0
            {
                resultString += "\(i.key)=\(i.value)"
            }
            else
            {
                resultString += "&\(i.key)=\(i.value)"
            }
        }
        return resultString
    }
    
    var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func printJson() {
        print(json)
    }
}
