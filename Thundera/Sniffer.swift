//
//  Sniffer.swift
//  Thundera
//
//  Created by Denis Nascimento on 1/4/17.
//  Copyright © 2017 fdnascimento. All rights reserved.
//

import UIKit

public class Sniffer: NSObject {
    
    
    public  func post() -> Void {
        
    }
    
    public  func get(urlString: String, completion: @escaping (_ code: Int, _ result: Data? ) -> Void)  {
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            let realResponse = response as? HTTPURLResponse
            
            if(error != nil){
                 completion((realResponse?.statusCode)!, nil)
            }else{
                do{
                    
                    completion((realResponse?.statusCode)!,data)
                    
                }catch let error as NSError{
                    completion((realResponse?.statusCode)!, nil)
                }
            }
        }).resume()
    }
        
}
