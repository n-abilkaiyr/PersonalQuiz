//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by Abilkaiyr Nurzhan on 11/13/20.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var progessView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count)
            rangedSlider.value = answerCount - 1
            print("did set is called")
            
        }
    }
    
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var multipleSwitchs: [UISwitch]!
    
    
    // MARK: - Private properities
   private let questions = Question.getQuestions()
   private var currentQuestionIndex = 0
   private var choosenAnswers: [Answer] = []
   private var currentAnswers: [Answer] {
    questions[currentQuestionIndex].answers
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? ResultViewController {
            resultVC.choosenAnswers = choosenAnswers
        }
    }
    
    @IBAction func singleButtonTapped(_ sender: UIButton) {
        guard let indexOfAnswer = singleButtons.firstIndex(of: sender) else {return}
        choosenAnswers.append(currentAnswers[indexOfAnswer])
        
        nextQuestion()
        
    }
    @IBAction func multipleAnswerTapped() {
        
        for (multipleSwitch, answer) in zip(multipleSwitchs, currentAnswers) {
            if multipleSwitch.isOn {
                choosenAnswers.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerTapped() {
        let index = lrintf(rangedSlider.value)
        choosenAnswers.append(currentAnswers[index])
        nextQuestion()
    }
}

// MARK: - Private methods
extension QuestionsViewController {
   private func updateUI() {
        // Hide stacks
        for stack in [singleStackView, multipleStackView, rangedStackView] {
            stack?.isHidden = true
        }
        // Set question for question label
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.text
        
        //Set progress view
        let progress = Float(currentQuestionIndex) / Float(questions.count)
        progessView.setProgress(progress, animated: true)
        
        // Set title
        title = "Вопрос №\(currentQuestionIndex + 1) из \(questions.count)"
        
        //show current stack
        showCurrentStackView(for: currentQuestion.type)
        
    }
    
    
    private func showCurrentStackView(for type: ResponseType) {
        
        switch type {
        case .single: showSingleStackView(with: currentAnswers)
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .ranged: showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    private func nextQuestion() {
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            updateUI()
            return
        }
        
        print(choosenAnswers)
        performSegue(withIdentifier: "showResult", sender: nil)
        
    }
    
    
    
}
