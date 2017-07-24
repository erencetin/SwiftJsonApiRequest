//
//  ViewController.swift
//  JsonApiSample
//
//  Created by eren cetin on 7/24/17.
//  Copyright © 2017 eren cetin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=umraniye&appid=9803d867cabd29b864efc9f3018efa16&units=metric"
        //let urlString = "http://bucayapimarket.com/json.php"
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!){
            (data,response,error) in
           
            if error != nil {
                print(error!)
            }
            else
            {
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSArray
                    print(json)
                }
                catch{
                    print(error)
                }
            }
            
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

