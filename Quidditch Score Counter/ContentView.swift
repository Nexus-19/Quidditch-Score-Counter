//
//  ContentView.swift
//  Quidditch Score Counter
//
//  Created by Soumyattam Dey on 23/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var score_griffindor=0
    @State private var score_slytherin=0
    @State private var outcome_title="Let the game begin !"
    @State private var isReset=false
    
    func tenTapped(_ team :Int){
        if(!isReset){
            if (team==1){
                score_griffindor+=10
                outcome_title="Gryffindor scored 10 points !"
            }
            else{
                score_slytherin+=10
                outcome_title="Slytherin scored 10 points !"
            }
        }
    }
    
    func twentyTapped(_ team:Int){
        if(!isReset){
            if (team==1){
                score_griffindor+=20
                outcome_title="Gryffindor scored 20 points !"
            }
            else{
                score_slytherin+=20
                outcome_title="Slytherin scored 20 points !"
            }
        }
    }
    
    func gotSnitch(_ team:Int){
        if(!isReset){
            if(team==1){
                score_griffindor+=100
            }else{
                score_slytherin+=100
            }
            if(score_slytherin<score_griffindor){
                outcome_title="Gryffindor wins !"
            }else{
                outcome_title="Slytherin wins !"
            }
        }
        isReset=true
    }
    
    func gameReset(){
        if(isReset){
            isReset=false
            score_slytherin=0
            score_griffindor=0
            outcome_title="Let the game begin !"
        }
        
    }
    
    var body: some View {
        VStack{
            HStack(){

                VStack(spacing:30){
                    Text("Gryffindor")
                        .font(.largeTitle)
                    Text("\(score_griffindor)")
                        .font(.system(size: 60))
                        .fontWeight(.medium)
                    Button(action: {
                        tenTapped(1)
                    }, label: {
                        Text("+10 Points")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.pink)
                            .cornerRadius(20)
                    })
                    
                    Button(action: {
                        twentyTapped(1)
                    }, label: {
                        Text("+20 Points")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.pink)
                            .cornerRadius(20)
                    })
                    Button(action: {
                        gotSnitch(1)
                    }, label: {
                        Text("Got the Snitch !")
                            .padding(10)
                            .foregroundColor(.white)
                            .background(Color.pink)
                            .cornerRadius(20)
                    })
                }
                
                Spacer()
                
        
                VStack(spacing:30){
                    Text("Slytherin")
                        .font(.largeTitle)
                    Text("\(score_slytherin)")
                        .font(.system(size: 60))
                        .fontWeight(.medium)
                    Button(action: {
                        tenTapped(2)
                    }, label: {
                        Text("+10 Points")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.pink)
                            .cornerRadius(20)
                    })
                    
                    Button(action: {
                        twentyTapped(2)
                    }, label: {
                        Text("+20 Points")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.pink)
                            .cornerRadius(20)
                    })
                    Button(action: {
                        gotSnitch(2)
                    }, label: {
                        Text("Got the Snitch !")
                            .padding(10)
                            .foregroundColor(.white)
                            .background(Color.pink)
                            .cornerRadius(20)
                    })
                }
                
                
            }
            .padding(50)
            
            
            Text("\(outcome_title)")
                .font(.largeTitle)
                .fontWeight(.light)
            
            Spacer()
            Button(action: {
                gameReset()
            }, label: {
                Text("Reset Game")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(20)
            })
            
            
            Spacer()
            
        }

        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
