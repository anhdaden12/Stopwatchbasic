//
//  ViewController.swift
//  StopWatch
//
//  Created by Apple on 11/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var timer = Timer()
    var isRunning: Bool = false
    var dataTable =  [Int]()
    var numberdisplay: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func onclickLap(_ sender: Any) {
       if (timer.isValid) {
           let number = numberdisplay
           dataTable.insert(number, at: 0)
           tableView.reloadData()
       } else {
           print("timer chua chay")
       }
    }
    
    
    @IBAction func onclickReset(_ sender: Any) {
        timer.invalidate()
        numberdisplay = 0
        lblResult.text = "\(numberdisplay)"
    }
    
    
    @IBAction func onClickStart(_ sender: Any) {
//        isRunning = !isRunning
        if !(timer.isValid) {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.countNumber), userInfo: nil, repeats: true)
            startButton.setTitle("Stop", for: .normal)
        } else {
            startButton.setTitle("Start", for: .normal)
            timer.invalidate()
        }
    }
    
    @objc func countNumber() {
        numberdisplay += 1
        lblResult.text = "\(numberdisplay)"
    }
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(dataTable[indexPath.row])"
        return cell
    }
    
}
