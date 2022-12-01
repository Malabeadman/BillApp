//
//  ViewController.swift
//  BillApp
//
//  Created by Deangelo Stewart on 11/13/22.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    let server = "http://localhost:3000"
    
    @IBOutlet weak var serverResponseLabel: UILabel!
    
    @IBAction func sendRequestButtonTappled(_ sender: UIButton) {
        guard let url  = URL(string: server) else {return}
        // background task to make request with URLSession
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {return}
            guard let dataString = String(data: data, encoding: String.Encoding.utf8) else {return}
            // update the UI if all went OK
            DispatchQueue.main.async {
                self.serverResponseLabel.text = dataString
            }
        }
        // start the task
        task.resume()
    }
}
