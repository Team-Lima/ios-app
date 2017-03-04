//
//  ServerComms.swift
//  NeuralGuide
//
//  Created by Tudor Avram on 02/03/17.
//  Copyright © 2017 Team Lima. All rights reserved.
//

import Foundation


class ServerHandler {
    
    private var server_url: URL

    
    /**
        CONSTRUCTOR
        
        @param url_string:  The url as a raw string
    */
    public init(url_string:String){
     
        self.server_url = URL(string: url_string)!
        
    }
    
    /**
        new_request()
        
        Method that : 
            (1) sends the image data to the server
            (2) waits for the response from the server
            (3) once it receives the response as a JSON, makes a few checks and returns the data as a CaptionResult object
     
        @param img:     The image data as a base64 string
        @returns :      The image result as a CaptionResult object
    */
    
    private func new_request(img: String) -> (CaptionResult, HTTPError) {
        
        // sending the JSON
        var dict: NSDictionary
        var err: HTTPError
        (dict, err) = self.send_json(data: img)
        
        // checking for errors
        
        if err != HTTPError.NoError{
            return (EmptyResult(), err)
        } else {
        
            let captionResult = CaptionResult()
            
            if captionResult.correctFormat(){
                err = 
            }
        }
        
    }
    
    private func send_json(data:String) -> (NSDictionary, HTTPError){
        
        let json_dict: [String: String] = [
            "data": data
        ]
        
        var reqResult: NSDictionary
        var reqError: HTTPError
        reqError = HTTPError.NoError
    
        do {
            let jsonData = try? JSONSerialization.data(withJSONObject:  json_dict,
                                                       options: .prettyPrinted)
            
            // creating the actual post request
            var request = URLRequest(url: self.server_url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in guard
                    let data = data, error == nil else {
                        print(error?.localizedDescription ?? "No data")
                        reqError = HTTPError.ServerError
                        return
                }
                
                do {
                    let result = try? JSONSerialization.jsonObject(with: data,
                                                                options: [])
                    if let jsonResult = result as? NSDictionary {
                        reqResult = jsonResult
                        reqError = HTTPError.NoError
                    } else {
                        print("ERROR: JSON not in the required format")
                        reqError = HTTPError.WrongJSONFormat
                        return
                    }
                } catch {
                    print("ERROR while deserialising the JSON result")
                    reqError = HTTPError.NotaJSON
                    return
                }
                
            }
            
        } catch {
            print("ERROR while making HTTP request")
            reqError = HTTPError.ConnectionError
        }
        
        return (reqResult, reqError)
        
    }
    
}
