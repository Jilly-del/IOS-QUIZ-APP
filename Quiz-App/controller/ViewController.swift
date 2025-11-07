//
//  ViewController.swift
//  Quiz-App
//
//  Created by MAC on 04/11/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var scores: UILabel!
    var questionNumber = 0
    var quizBrain = QuizBrain()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
      
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.AnsweredQuestion(userAnswer)
        
        
        if (userGotItRight) {
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(UpdateUI), userInfo: nil, repeats: false)
        
    }
    
   @objc func UpdateUI(){
        
       trueButton.backgroundColor = UIColor.clear
       falseButton.backgroundColor = UIColor.clear
       let question = quizBrain.question()
       let progress = quizBrain.progress()
       let score = String(quizBrain.score)
       scores.text = "Score: \(score)"
        questionLabel.text = question
       progressBar.progress = progress
    }
}

