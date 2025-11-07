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
    @IBOutlet weak var scores: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    var quizBrain = QuizBrain()
    var shouldResetQuiz = false
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        if shouldResetQuiz {
                    quizBrain.score = 0
                    quizBrain.questionNumber = 0
                    shouldResetQuiz = false
                    UpdateUI()
                }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
             let destinationVC = segue.destination as! ResultViewController
             destinationVC.quizBrain = quizBrain
            destinationVC.parentVC = self
         }
    }
    
 
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.AnsweredQuestion(userAnswer)
        sender.backgroundColor = userGotItRight ? UIColor.green :UIColor.red
        
        if quizBrain.questionNumber + 1 == quizBrain.quiz.count {
            
             performSegue(withIdentifier: "resultSegue", sender: self)
         } else {
             quizBrain.nextQuestion()
         }
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.UpdateUI()
               sender.backgroundColor = UIColor.clear
            
           }

    }
    
    
   @objc func UpdateUI(){
       
       questionLabel.text = quizBrain.getQuestionText()
       
       var options = quizBrain.getOptions()
       option1.setTitle(options[0], for: .normal)
       option2.setTitle(options[1], for: .normal)
       option3.setTitle(options[2], for: .normal)
       option4.setTitle(options[3], for: .normal)
       
      
       let progress = quizBrain.progress()
       progressBar.progress = progress
       
       let score = String(quizBrain.score)
       scores.text = "Score: \(score)"
      
       
    }
}

