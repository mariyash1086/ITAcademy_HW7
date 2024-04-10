//
//  ViewController.swift
//  Unit 6_HW
//
//  Created by milly1086 on 03.04.2024.
//

import UIKit

enum direction{
    case left
    case right
    case up
    case down
}

class ViewController: UIViewController {

  
    @IBOutlet weak var test: UILabel!
    //MARK: Buttons
    @IBOutlet weak var UP: UIButton!
    @IBOutlet weak var down: UIButton!
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    
    @IBOutlet weak var attention: UILabel!
    
    //MARK: constant
    let ball = UIView()
    var maxX :Int=0
    var maxY:Int = 0
    
    var xUp: Int = 0
    var yUp: Int = 0
    var xLeft: Int = 0
    var yLeft: Int = 0
    var xRight: Int = 0
    var yRight: Int = 0
    var xDown: Int = 0
    var yDown: Int = 0
    
    //MARK: view actions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("SOME BIG LABEL".fixString())
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
        maxX  = Int(view.frame.width)
        maxY = Int(view.frame.height)
        
        xUp = Int(UP.frame.origin.x)
        yUp = Int(UP.frame.origin.y)
        xLeft = Int(left.frame.origin.x)
        yLeft = Int(left.frame.origin.y)
        xRight = Int(right.frame.origin.x)
        yRight = Int(right.frame.origin.y)
         
        createBall()
   
    }
    
    //MARK: ball functions
    func createBall(){
        print("XX-3 print")
        ball.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        ball.backgroundColor = generateColor()
        ball.layer.cornerRadius = 50
        view.addSubview(ball)

      //  let recogniser = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        
     //   ball.addGestureRecognizer(recogniser)
    }
    

    @objc func tapDetected(){    
        ball.frame.origin.x = CGFloat(Int.random(in: 1...maxX-100))
        ball.frame.origin.y = CGFloat(Int.random(in: 1...maxY-100))
        ball.backgroundColor = generateColor()
    }
    
    //MARK: other
    func generateColor() -> UIColor{
        let intColor = Int.random(in: 1...5)
        
        switch intColor {
        case 1: return .red
        case 2: return .blue
        case 3: return .yellow
        case 4: return .black
        case 5: return .gray
        default: return .brown
        }
    }
    
    //MARK: move ball
    @IBAction func moveRight(_ sender: UIButton) {
        moveTo(to: .right)
    }
    @IBAction func moveLeft(_ sender: UIButton) {
        moveTo(to: .left)
    }
    @IBAction func moveDown(_ sender: UIButton) {
        moveTo(to: .down)
    }
    
    @IBAction func mobeUp(_ sender: UIButton) {
        moveTo(to: .up)
    }
    
    func moveTo(to direction: direction) {
        
        attention.text = ""
        switch direction {
        case .left :
            attention.text = String("Left")
            if compareXY(x: -40, y: 0){
                ball.frame.origin.x -= 40
            }
        case .down :
            attention.text = String("Down")
            if compareXY(x: 0, y: 40){
                ball.frame.origin.y += 40
            }
        case .right :
            attention.text = String("Right")
            if compareXY(x: 40, y: 0){
                ball.frame.origin.x += 40
            }
        case .up :
            attention.text = String("Up")
           if compareXY(x: 0, y: -40){
            ball.frame.origin.y -= 40
            }
        }
    }
    
    //MARK: compare
    func compareXY(x:Int, y:Int) ->Bool {
    
        
        let xBall:Int = Int(ball.frame.origin.x)
        let yBall: Int = Int(ball.frame.origin.y)
        
        let newXBall :Int = xBall + x + 50
        let newYBall :Int = yBall + y + 50
        
        if newXBall >= xLeft && newYBall  >= yLeft{
            attention.text = "ATTENTION"
            return false
        }
        
        if newXBall >= xUp && newYBall  >= yUp{
            attention.text = "ATTENTION"
            return false
        }
         if newXBall >= xRight && newYBall  >= yRight {
            attention.text = "ATTENTION"
            return false
        }
        
        //упирается в стену
        if newXBall >= maxX ||
            yBall + 50 + y >= maxY ||
            xBall + x < 0 ||
            yBall + y < 0 {
            attention.text = "ATTENTION"
            return false
        }
        
        //тут нужна проверка по координатам кнопок, хз как делать
        return true
    }
    
}


