//
//  Question.swift
//  PersonalQuiz
//
//  Created by Abilkaiyr Nurzhan on 11/9/20.
//

enum  ResponseType {
    case single
    case multiple
    case ranged
}

struct Question {
    let text: String
    let type: ResponseType
    var answers: [Answer]
}
 

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(text: "Какую пищу вы предпочитаете?",
                     type: .single,
                     answers:[ Answer(text: "Стейк", type: .dog),
                               Answer(text: "Морковь", type: .rabbit),
                               Answer(text: "Рыба", type: .cat),
                               Answer(text: "Кукуруза", type: .turtle) ]),
            
            Question(text: "Что вам нравится больше?",
                     type: .multiple,
                     answers:[ Answer(text: "Плавать", type: .dog),
                               Answer(text: "Спать", type: .rabbit),
                               Answer(text: "Обниматься", type: .cat),
                               Answer(text: "Есть", type: .turtle) ]),
            
            Question(text: "Любите ли вы поездки на машине?",
                     type: .ranged,
                     answers:[ Answer(text: "Ненавижу", type: .cat),
                               Answer(text: "Нервничаю", type: .rabbit),
                               Answer(text: "Незамечаю", type: .turtle),
                               Answer(text: "Обожаю", type: .dog) ])
            
                 ]
    }
}
