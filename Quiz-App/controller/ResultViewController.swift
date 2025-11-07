
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultlabel: UILabel!
    weak var parentVC: ViewController?
    var quizBrain:QuizBrain!
    var finalscore = 0
    
    override func viewDidLoad() {
        
        self.navigationItem.hidesBackButton = true
        super.viewDidLoad()
        showResultMessage()
    }
    
    func showResultMessage() {
            if quizBrain.score >= 7 {
                resultlabel.text = """
                🏆🔥 You’re a proper Naija boy! 🇳🇬
                You sabi your history 🧠👏
                🎯 Your Score: \(quizBrain.score)/\(quizBrain.quiz.count)
                """
            } else {
                resultlabel.text = """
                😅 You need to go buy Current Affairs book o! 📘😂
                🎯 Your Score: \(quizBrain.score)/\(quizBrain.quiz.count)
                📚 Brush up your Naija history sharp-sharp! 🇳🇬💪
                """
            }
        }
    
    @IBAction func tryAgain(_ sender: UIButton) {
        parentVC?.shouldResetQuiz = true
        navigationController?.popViewController(animated: true)
    }
    
}
