//
//  ScrollabeQuizViewController.swift
//  QuizApp
//
//  Created by Domagoj Kolaric on 09/06/2020.
//  Copyright © 2020 Domagoj Kolaric. All rights reserved.
//

import UIKit

class ScrollabeQuizViewController: UIViewController {
    
    let scrollableQuizView = ScrollableQuizView()
    
    var quiz: Quizz!
    var result: Result!
    var startTimer: TimeInterval?
    var currentQuestionIndex = 0
    var time: Double? = nil
    var correctAnswers = 0 {
        didSet {
            self.scrollableQuizView.correctAnsLabel.text = "\(correctAnswers)/\(quiz.questions?.count ?? 0)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PopQuiz"
        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.activetaTime()
        self.setupQuiz()
    }
    
    func setupView() {
        self.setBackgroundColor()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.view.addSubview(scrollableQuizView)
        scrollableQuizView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollableQuizView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollableQuizView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollableQuizView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollableQuizView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        scrollableQuizView.sendResultButton.addTarget(self, action: #selector(onSendResult), for: .touchUpInside)
    }
    
    func setupQuiz() {
        self.scrollableQuizView.setupQuestion(quiz: quiz)
        
        scrollableQuizView.questionViews.forEach{ questionView in
            questionView.answerButtons.forEach{ btn in
                btn.addTarget(self, action: #selector(onAnswerBtnTapped), for: .touchUpInside)
            }
        }
    }
    
    func activetaTime() {
        self.startTimer = Date.timeIntervalSinceReferenceDate
        scrollableQuizView.scrollView.alpha = 1.0
    }
    
    @objc
    func onAnswerBtnTapped(_ sender: UIButton) {
        guard let questions = self.quiz.questions?.allObjects as? [Questionn] else { return }
        if sender.tag == Int(questions[currentQuestionIndex].correctAns) {
            self.correctAnswers += 1
            UIView.animate(withDuration: 0.4){
                sender.backgroundColor = UIColor.green
            }
        } else {
            UIView.animate(withDuration: 0.4){
                sender.backgroundColor = UIColor.red
            }
        }

        currentQuestionIndex += 1

        let current = scrollableQuizView.scrollView.contentOffset
        UIView.animate(withDuration: 0.4, delay: 0.5, options:UIView.AnimationOptions.curveEaseInOut, animations: {
            self.scrollableQuizView.scrollView.contentOffset = CGPoint(x: current.x+self.view.frame.width, y: 0)
        })

        if currentQuestionIndex == quiz.questions?.count {
            guard startTimer != nil else { return }
            self.timeCalculation()
        }
    }
    
    func timeCalculation() {
        let time = Date().timeIntervalSinceReferenceDate - self.startTimer!
        self.time = time
        let minutes : Int = Int(time) / 60
        let seconds = time - Double(minutes * 60)
        
        UIView.animate(withDuration: 0.7, delay: 0.5, options:UIView.AnimationOptions.curveEaseInOut, animations: {
            self.scrollableQuizView.scrollView.alpha = 0.0
            self.scrollableQuizView.correctAnsLabel.alpha = 1.0
            self.scrollableQuizView.sendResultButton.alpha = 1.0
            self.scrollableQuizView.quizTimeLabel.alpha = 1.0
            self.scrollableQuizView.quizTimeLabel.text = "\(minutes):\(round(seconds*100)/100)"
        })
    }
    
    @objc
    func onSendResult(_ sender: UIButton) {
        guard let userId = UserDefaults.standard.object(forKey: "id") as? Int,
            let time = self.time else {
            return
        }
        
        let result = Result(quiz_id: Int(self.quiz.id), user_id: userId, time: time, no_of_correct: correctAnswers)
        
        self.result = result
        
        self.sendResult()
    }
    
    func sendResult() {
        QuizAPI.instance.sendQuizResult(result: result) { [weak self] response, err in
            guard let self = self else { return }
            
            guard err == nil else {
                if let error = err {
                    DispatchQueue.main.async {
                        self.quizAlert(description: error.localizedDescription)
                    }
                }
                return
            }
            
            guard let response = response else { return }
            
            if response.rawValue == 200 {
                DispatchQueue.main.async {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            } else {
                DispatchQueue.main.async {
                    self.quizAlert(description: response.stringServerResponse)
                }
            }
        }
    }
    
    func quizAlert(description: String) {
        let alertController = UIAlertController(title: "Error!", message: description, preferredStyle: .alert)
        let action = UIAlertAction(title: "Send again", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: self.sendResult)
    }
    
    deinit {
        print("Deinit scrollableVC..")
    }
}
