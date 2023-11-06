//
//  ContentView.swift
//  Guess the flag
//
//  Created by Olaleye Daniel Ifeoluwa on 06/11/2023.
//

import SwiftUI



struct ContentView: View {
    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var totalScore = 0
    @State private var scoreTitle = ""
    @State private  var countries = ["Estonia", "France", "Germany", "Ireland", "Italy","Nigeria", "Poland","Russia", "Spain","UK", "US"].shuffled()
    @State private var questionNumber = 0
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View{
        
        ZStack {
           
           LinearGradient(gradient: Gradient(colors:[.blue, .black]), startPoint: .top, endPoint: .bottom)

            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack (spacing: 15){
                    VStack{
                        Text("Tap the flag of")
                          
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                          
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){ number in
                        Button {
                            flaggedTapped(number)
                            
                        } label:{
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                                
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text(" Score: \(totalScore) / 8")
                    .font(.title.bold())
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
        .ignoresSafeArea()
        .alert(scoreTitle, isPresented: $showingScore){
            if questionNumber == 8{
                Button("Restart", action: restartQuestion)
            }else{
                Button("Continue", action: askQuestion)
            }
           
            
        } message: {
            if questionNumber == 8{
                Text("Your final score is \(totalScore)")
            }else{
                Text("Your score is \(totalScore)")
            }
           
        }
    }
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func restartQuestion(){
        totalScore = 0
        questionNumber = 0
    }
    func flaggedTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            totalScore += 1
            questionNumber += 1
        }else{
            scoreTitle = "Wrong! That's  the flag of \(countries[number])"
            questionNumber += 1
        
        }
        showingScore = true
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

