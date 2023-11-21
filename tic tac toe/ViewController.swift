//
//  ViewController.swift
//  tic tac toe
//
//  Created by Tenizbayev Bolat on 01.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //    var k = 0
    //
    //    var player = 1
    //
    //    var state = [0,0,0,0,0,0,0,0,0]
    //
    //    var win = [[0,1,2], [0,3,6], [3,4,5], [6,7,8], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        // Do any additional setup after loading the view.
    //    }
    //
    //    @IBAction func game(_ sender: UIButton) {
    //        print(sender.tag)
    //
    //        if state[sender.tag - 1] != 0{
    //            return
    //        }
    //
    //        k = k+1
    //
    //        if player == 1{
    //            sender.setBackgroundImage(UIImage(named: "x"), for: .normal)
    //            player = 2
    //            state[sender.tag-1] = 1
    //        }
    //        else{
    //            sender.setBackgroundImage(UIImage(named: "o"), for: .normal)
    //            player = 1
    //            state[sender.tag-1] = 2
    //        }
    //
    //
    //        for wina in win {
    //            if state[wina[0]] == 1 && state[wina[1]] == 1 && state[wina[2]] == 1{
    //                print("the X is winner")
    //                let alert = UIAlertController(title: "X wins", message: "", preferredStyle: .alert)
    //                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
    //                    UIAlertAction in
    //                    self.clear()
    //                }))
    //
    //                present(alert, animated: true, completion: nil)
    //                return
    //            }
    //            if state[wina[0]] == 2 && state[wina[1]] == 2 && state[wina[2]] == 2{
    //                print("the O is winner")
    //                let alert = UIAlertController(title: "O wins", message: "", preferredStyle: .alert)
    //                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
    //                    UIAlertAction in
    //                    self.clear()
    //                }))
    //
    //                present(alert, animated: true, completion: nil)
    //                return
    //            }
    //        }
    //        if k == 9{
    //            let alert = UIAlertController(title: "Nobody wins", message: "", preferredStyle: .alert)
    //            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
    //                UIAlertAction in
    //                self.clear()
    //            }))
    //
    //            present(alert, animated: true, completion: nil)
    //        }
    //    }
    //
    //    func clear(){
    //        player=1
    //        k = 0
    //        for i in 0...8{
    //            state[i] = 0
    //            let button = view.viewWithTag(i+1) as! UIButton
    //            button.setBackgroundImage(nil, for: .normal)
    //        }
    //    }
    //}
    
    var state = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    var image = ["1","2","3","4","5","6","7","8","1","2","3","4","5","6","7","8"].shuffled()
    
    var isOpened = false
    
    var isFreezed = false
    
    var lastIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func flip(_ sender: UIButton) {
        if isFreezed == false && lastIndex != sender.tag && state[sender.tag - 1] < 1{
            
            sender.setBackgroundImage(UIImage(named: image[sender.tag-1]), for: .normal)
            
            if isOpened == true{
                
                if image[sender.tag - 1] != image[lastIndex-1]{
                    
                    isFreezed = true
                    
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                        sender.setBackgroundImage(nil, for: .normal)
                        let lastButton = self.view.viewWithTag(self.lastIndex) as! UIButton
                        lastButton.setBackgroundImage(nil, for: .normal)
                        self.isFreezed = false
                        self.lastIndex = 0
                    }
                }
                else{
                    state[sender.tag-1] = 1
                    
                    state[lastIndex-1] = 1
                }
            }
            else{
                lastIndex = sender.tag
            }
            
            isOpened.toggle()
            
        }
        checkForWin()
    }
                
    func checkForWin() {
            // Your existing win condition check...
            if state[0] > 0 && state[1] > 0 && state[2] > 0 && state[3] > 0 && state[4] > 0 && state[5] > 0 && state[6] > 0 && state[7] > 0 && state[8] > 0 && state[9] > 0 && state[10] > 0 && state[11] > 0 && state[12] > 0 && state[13] > 0 && state[14] > 0 && state[15] > 0 {
                showWinMessage()
            }
        }

        func showWinMessage() {
            let alert = UIAlertController(title: "Congratulations!", message: "You won!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.clear()
            }))
            present(alert, animated: true, completion: nil)
        }
    
        func clear(){
            isOpened = false
            image = ["1","2","3","4","5","6","7","8","1","2","3","4","5","6","7","8"].shuffled()
            isFreezed = false
            lastIndex = 0
            for i in 0...15{
                state[i] = 0
                let button = view.viewWithTag(i+1) as! UIButton
                button.setBackgroundImage(nil, for: .normal)
            }
        }
    
}

