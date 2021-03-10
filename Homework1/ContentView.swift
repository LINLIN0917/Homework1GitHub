//
//  ContentView.swift
//  Homework1
//
//  Created by Linlin on 2021/3/6.
//

import SwiftUI

struct ContentView: View {
    @State private var answerShow = false
    @State private var number = 0
    @State private var finish = false
    var body: some View {
        if finish == false{
            VStack(alignment:.center){
                Text("猜燈謎遊戲！")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .leading, endPoint: .trailing))
                HStack{
                    Text("第" + String(number+1) + "題")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                        .frame(width: 60)
                    Button(action: {
                        if number < 9{
                            number = number + 1
                            answerShow = false
                        }else{
                            questions.shuffle()
                            number = 0
                            finish = true
                            answerShow = false
                        }
                    }, label: {Text("下一題")
                        .font(.title2)
                        .bold()
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.blue, lineWidth: 5)
                        )})
                }
                Text(questions[number].question)
                    .bold()
                    .padding()
                    .font(.title)
                
                ExtractedView()
                Spacer()
                    .frame(width: 100, height: 20)
                HStack{
                    Button(action: {answerShow = true}, label: {
                            Text("點我看謎底")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.red)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.red, lineWidth: 5)
                                )})
                    if answerShow == true{
                        Text(questions[number].answer)
                            .bold()
                            .font(.title)
                            .padding()
                    }
                }
            }
        }
        else{
            Button(action: {questions.shuffle()
                    number = 0
                    finish = false}, label: {Text("再玩一次")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.purple)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.purple, lineWidth: 5)
                        )
                    })
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    var body: some View {
        Image("background")
            .resizable()
            .scaledToFit()
    }
}
