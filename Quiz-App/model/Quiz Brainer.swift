import UIKit

struct QuizBrain {
    
    var quiz = [
        Question(
            question: "🇳🇬 When did Nigeria gain independence from Britain? 🎉",
            options: ["A. 1957", "B. 1960", "C. 1963", "D. 1970"],
            answer: "B. 1960"
        ),
        Question(
            question: "👑 Who was Nigeria’s first Prime Minister?",
            options: ["A. Nnamdi Azikiwe", "B. Obafemi Awolowo", "C. Tafawa Balewa", "D. Ahmadu Bello"],
            answer: "C. Tafawa Balewa"
        ),
        Question(
            question: "📅 What year did Nigeria become a republic?",
            options: ["A. 1959", "B. 1960", "C. 1963", "D. 1979"],
            answer: "C. 1963"
        ),
        Question(
            question: "🏛️ Who was Nigeria’s first President?",
            options: ["A. Nnamdi Azikiwe", "B. Olusegun Obasanjo", "C. Yakubu Gowon", "D. Ernest Shonekan"],
            answer: "A. Nnamdi Azikiwe"
        ),
        Question(
            question: "⚔️ What was the name of the war fought between 1967 and 1970 in Nigeria?",
            options: ["A. The Niger Delta War", "B. The Yoruba Uprising", "C. The Biafran War", "D. The Civil War"],
            answer: "D. The Civil War"
        ),
        Question(
            question: "🪖 Who led the military coup of January 1966?",
            options: ["A. Yakubu Gowon", "B. Aguiyi Ironsi", "C. Chukwuma Kaduna Nzeogwu", "D. Murtala Mohammed"],
            answer: "C. Chukwuma Kaduna Nzeogwu"
        ),
        Question(
            question: "🗺️ When was the amalgamation of Northern and Southern Nigeria?",
            options: ["A. 1900", "B. 1914", "C. 1923", "D. 1945"],
            answer: "B. 1914"
        ),
        Question(
            question: "⚡ Who was the military Head of State after the 1975 coup?",
            options: ["A. Yakubu Gowon", "B. Murtala Mohammed", "C. Olusegun Obasanjo", "D. Muhammadu Buhari"],
            answer: "B. Murtala Mohammed"
        ),
        Question(
            question: "🛢️ Which Nigerian region first discovered crude oil in commercial quantity?",
            options: ["A. Northern Region", "B. Western Region", "C. Eastern Region", "D. Mid-Western Region"],
            answer: "C. Eastern Region"
        ),
        Question(
            question: "🗳️ In what year did Nigeria return to democratic rule after military regimes?",
            options: ["A. 1993", "B. 1998", "C. 1999", "D. 2003"],
            answer: "C. 1999"
        )
    ]
    var score = 0
    var questionNumber = 0
    
    func getQuestionText() -> String {
        return quiz[questionNumber].question
    }
    
    func getOptions () -> [String] {
        return quiz[questionNumber].options
    }
    
    mutating func AnsweredQuestion (_ answer : String) -> Bool{
        if answer == quiz[questionNumber].answer {
            score += 1
            return true }
        else {
         return  false
        }
    }
    

    mutating  func nextQuestion() {
           if questionNumber + 1 < quiz.count {
               questionNumber += 1
           } else {
               score = 0
               questionNumber = 0
           }
           
      }
    

    

    

    
    
  
    func progress() -> Float{ Float(questionNumber + 1) / Float(quiz.count)}
    
    
}
