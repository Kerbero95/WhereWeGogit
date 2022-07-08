//
//  ContentView.swift
//  VistaQuiztvOS
//
//  Created by Stefano Leva on 03/07/22.
//

import SwiftUI
import AVKit
import AVFoundation

struct QuestionViewtvOS: View {
    let question: Question
    var bounds = UIScreen.main.bounds
//    let questions: [Question] = Question.fetchQuestions()
    
    var body: some View {
        
//        var question = questions[1]
        
        ZStack{
            //Call PlayerView for Looped Videos
            PlayerView(video: "Mare")
            
            VStack(spacing:100){
                HStack(spacing:100){
                    let redButton =
                    Text("\(question.option1)")
                    .tint(.white)
                    .font(.system(size: 80.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)

                    redButton.background(.red)

                    Spacer()

                    let greenButton =
                    Text("\(question.option2)")
                        .tint(.black)
                        .font(.system(size: 80.0, weight: .bold, design: .default))
                        .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)

                    greenButton.background(.green)
                }
                .frame(width: 1700, height: 400)

                Spacer()

                HStack(spacing:100){
                    let blueButton =
                    Text("\(question.option3)")
                    .tint(.white)
                    .font(.system(size: 80.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)

                    blueButton.background(.blue)

                    Spacer()

                    let purpleButton =
                    Text("\(question.option4)")
                        .tint(.white)
                        .font(.system(size: 80.0, weight: .bold, design: .default))
                        .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)

                    purpleButton.background(.purple)
                }
                .frame(width: 1700, height: 400)
            }
            HStack{
                Spacer()

                Rectangle()
                .cornerRadius(200)
                .frame(width: bounds.size.width * 0.3, height: bounds.size.height * 0.3)

                Spacer()
            }

            HStack{
                Spacer()

                Text("\(question.question)")
                    .foregroundColor(.black)
                    .font(.system(size: 70.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.3, height: bounds.size.height * 0.3)

                Spacer()
            }
        }
    }
}

struct QuestionViewtvOS_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViewtvOS(question: Question(question: "Ciao", option1: "ciao", option2: "ciao", option3: "ciao", option4: "ciao"))
    }
}
