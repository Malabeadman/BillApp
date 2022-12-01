//
//  ContentView.swift
//  BillApp
//
//  Created by Deangelo Stewart on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    let server = "http://127.0.0.1:3000/"

    var serverLabel: String = "Hi"
    //let Text: SeverLab;
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(serverLabel).id(1)
            Button("Send Request to server") {
                guard let url  = URL(string: server) else {return}
                
                let task = URLSession.shared.dataTask(with: url) {
                    (data, response, error) in
                    if let error = error {
                        print(error)
                        return
                    }
                    guard let data = data else {return}
                    guard let dataString = String(data: data, encoding: String.Encoding.utf8) else {return}
                    DispatchQueue.main.async {
                        print(dataString)
                        //dataString = serverLabel

                    }
                }
                task.resume()
            }

            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


