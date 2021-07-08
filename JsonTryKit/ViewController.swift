//
//  ViewController.swift
//  JsonTryKit
//
//  Created by Faith Pelletier-king on 2021-07-08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://at-ease-api-test.herokuapp.com/"
        
        
        
        
        getData(from: url)
    }
    
    private func getData(from url: String) {
            let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data) 
                
            }
            catch {
                print("failed to convert \(error.localizedDescription) ")
            }
            guard let json = result else {
                return
            }
                print(json.users.id)
                print(json.users.firstname)
                print(json.users.secondname)
                print(json.users.email)
            
        })
        task.resume()
    }


}

struct Response: Codable {
    let users: MyResults
    let status: String
}

struct MyResults: Codable {
    let id: Int
    let firstname: String
    let secondname: String
    let email: String
}

/*
{"results":{"sunrise":"1970-01-01T00:00:01+00:00","sunset":"1970-01-01T00:00:01+00:00","solar_noon":"2020-01-01T09:20:39+00:00","day_length":0,"civil_twilight_begin":"1970-01-01T00:00:01+00:00","civil_twilight_end":"1970-01-01T00:00:01+00:00","nautical_twilight_begin":"1970-01-01T00:00:01+00:00","nautical_twilight_end":"1970-01-01T00:00:01+00:00","astronomical_twilight_begin":"1970-01-01T00:00:01+00:00","astronomical_twilight_end":"1970-01-01T00:00:01+00:00"
 
 },
    "status":"OK"
 
 }

*/



