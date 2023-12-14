//
//  ViewController_XO.swift
//  X-O
//
//  Created by Aljwhra Alnasser on 14/12/2023.
//

import UIKit

class ViewController_XO: UIViewController {
    
    
    enum Turn {
        case The_x
        case The_o
        
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    
    var firstTurn = Turn.The_x
    var currentTurn = Turn.The_x
    
    var The_X = "X"
    var The_O = "O"
    var board = [UIButton]()
    
    
    var the_xScore = 0
    var the_oScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBoard()
    }
    
    
    func initBoard(){
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
        
    }
    
    
    @IBAction func boardTapAction(_ sender: UIButton){
        
        addToBoard(sender)
        
        if checkForVictory(The_X){
            
            the_xScore += 1
            resultAlert(title: "The X win 🥇")
            
        }
        
        if checkForVictory(The_O){
            
            the_oScore += 1
            resultAlert(title: "The O win 🥇")
        }
        
        if(fullBoard()){
            resultAlert(title: "Draw")
        }
        
    }
    
    
    func checkForVictory(_ s: String) -> Bool{
        
        
        // Horizontal Victory
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s){
            
            return true
        }
        
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s){
            
            return true
        }
        
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s){
            
            return true
        }
            
        
        // Vertical Victory
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s){
            
            return true
        }
        
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s){
            
            return true
        }
        
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s){
            
            return true
        }
        
        // Diagonal Victory
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s){
            
            return true
        }
        
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s){
            
            return true
        }
        
        return false
    }
    
    func thisSymbol(_ button : UIButton, _ symbol: String) -> Bool {
        
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title: String){
        
        let message = "\nThe O Score: " + String(the_oScore) + "\n\nThe X Score: " + String(the_xScore)
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Result", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        
        self.present(ac, animated: true)
        
    }
    
    
    func resetBoard(){
        
        for button in board {
            
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        
        if firstTurn == Turn.The_o{
            
            firstTurn = Turn.The_x
            turnLabel.text = The_X
        }
        
       else if firstTurn == Turn.The_x {
            firstTurn = Turn.The_o
            turnLabel.text = The_O
        }
        
        currentTurn = firstTurn
        
    }
    
    func fullBoard() -> Bool{
        for button in board{
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    
    func addToBoard(_ sender: UIButton){
        
        if(sender.title(for: .normal) == nil){
            
            if(currentTurn == Turn.The_o){
                sender.setTitle(The_O, for: .normal)
                currentTurn = Turn.The_x
                turnLabel.text = The_X
            }
            
           else if(currentTurn == Turn.The_x){
                sender.setTitle(The_X, for: .normal)
                currentTurn = Turn.The_o
                turnLabel.text = The_O
            }
        }
        
        sender.isEnabled = false
        
    }

}
