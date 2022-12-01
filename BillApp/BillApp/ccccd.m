//
//  ccccd.m
//  BillApp
//
//  Created by Deangelo Stewart on 11/16/22.
//

#import <Foundation/Foundation.h>
import UIKit;

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
See this Q&A for more info about making an HTTP request in Swift.

4. Test the iOS app
Run the app. Press the button and hopefully you should see the Hello World response.


Success! Client-Server communication on between Node.js and iOS.

Going on
You will want to learn more about the following topics to create a fuller app.

Parsing Simple JSON in Flutter
Easy JSON examples
URLSession docs and tutorial
Creating a REST API

