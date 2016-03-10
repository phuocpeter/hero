//
//  LoginViewController.swift
//  Hero Game
//
//  Created by Tran Thai Phuoc on 2016-03-09.
//  Copyright © 2016 Tran Thai Phuoc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var server: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login() {
        postToServer()
    }
    
    func postToServer() {
        let url = NSURL(string: "http://" + server.text!)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        let postString = "name=\(name.text!)&key=\(pass.text!)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                // Error occurred
                print(error)
            }
            if let ddata = data {
                // Check if the host is connectable
                do {
                    print("JSON")
                    let json = try NSJSONSerialization.JSONObjectWithData(ddata, options: .MutableContainers) as? NSDictionary
                    if let parseJSON = json {
                        // Parse json
                        let status = parseJSON["status"] as? String
                        let message = parseJSON["message"] as? String
                        dispatch_async(dispatch_get_main_queue(), {
                            // Display alert from main thread
                            self.displayAlert(status!, message: message!)
                        })
                    }
                } catch let jsonErr as NSError {
                    // Error parsing json
                    print(jsonErr)
                }
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    self.displayAlert("Error", message: "Failed to connect to host")
                })
            }

        }
        task.resume()
    }
    
    // MARK: Helper Methods
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
