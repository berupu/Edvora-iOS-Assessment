//
//  ContentView.swift
//  Edvora iOS Assessment
//
//  Created by be RUPU on 20/12/21.
//

import SwiftUI

var emailOk = false
var passOk = false
var usernameOk = false
var allOk = false

struct ContentView: View {
    
    
    var body: some View {
        
        VStack {
            
            
            EdvoraLogo()

            VStack(spacing: 20.0) {
                
                EdvoraTextField(placeholder: "TheEdvorian", text: "Username", icon: "person")
                EdvoraTextField(placeholder: "", text: "Password", icon: "lock")
                EdvoraTextField(placeholder: "", text: "       Email address", icon: "@")
            
            }
            
            
            Forgottenpassword()
            
            LogIn()

            DontHaveAccount()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








struct EdvoraTextField: View {
    
    @State var placeholder = "" //TheEdvorian
    @State var text = "" //username
    var icon = ""
    @State private var isSecured: Bool = false
    
    var body: some View {
       
        
            ZStack {
                Image("rectangle")
                    .frame(width: 302, height: 52.0)
                    .textFieldStyle(.roundedBorder)
                
            
                Image(icon)
                    .frame(width: 50, height: 50)
                    .offset(x: -126, y: 0)
                    .foregroundColor(.gray)
                
                if text == "Password", isSecured {
                    
                    SecureField("", text: $placeholder)
                        .frame(width: 290, height: 52.0)
                        .offset(x: 35, y: 0)
                        .foregroundColor(.black)
                        .onSubmit {
                            check(placeholder,text)
                        }
                    
                } else {
                    
                    TextField("", text: $placeholder)
                        .frame(width: 290, height: 52.0)
                        .offset(x: 35, y: 0)
                        .foregroundColor(.black)
                        .disableAutocorrection(true)
                        .onSubmit {
                            check(placeholder,text)
                        }
      
                }
                
                Button(action: {
                    isSecured.toggle()
                }) {
                    
                    if text == "Password"{
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                }
                .offset(x: 112, y: 0)
                
                
                Text(text)
                    .offset(x: -95, y: -25)
                    .foregroundColor(.gray)
                    //.background(.blue)
                    
                
                    
        }
        
    
    }
    
    func check(_ placeholder: String, _ text: String) {
        if text == "Username" {
            if text.contains(" "), text.contains(text.uppercased()) {
                usernameOk = false
            }else {
                usernameOk = true
            }
        } else if text == "Password" {
            
            //let number = ["1","2","3","4","4","5","6","8","9"]
            
            if text.count >= 8 && text.contains(text.uppercased()), text.contains(text.lowercased()){
                
                passOk = true
            }else {
                passOk = false
            }
        } else if text == "       Email address" {
            if text.contains("@gmail.com") {
                emailOk = true
            }else {
                emailOk = false
            }
        }
        
        if usernameOk,passOk,emailOk {
            allOk = true
        }
        
    }
}

struct Forgottenpassword: View {

    var body: some View {
        Button("Forgotten password?") {
            print("Go to forget password process....")
        }
        .padding(.leading,138)
        .foregroundColor(Color("forgotten"))
    }
}

struct LogIn: View {

    var body: some View {
        Button("LOGIN") {
            print("login Tapped ")
        }
        .foregroundColor(.white)
        .font(.system(.headline))
        .frame(width: 302, height: 52)
        .background(Color("login"))
        .cornerRadius(12)
        .offset(x: 0, y: 160)
        .opacity(allOk ? 1 : 0.5)
        
    }
}


struct DontHaveAccount: View {

    var body: some View {
        HStack{
            
            Text("Don’t have an account?")
            
            Button("Sign up") {
                print("Go to sign up process....")
            }
            //.padding(.leading)
            .foregroundColor(Color("forgotten"))
            .font(.system(.headline))
        }
        .offset(x: 0, y: 190)
    }
}

struct EdvoraLogo: View {

    var body: some View {
        ZStack {
            Image("logo")
                .offset(x: 0, y: -90)
            
            Image("vector")
                .frame(width: 13, height: 11)
                .offset(x: -12, y: -89)
            
            Image("vector2")
                .frame(width: 13, height: 11)
                .offset(x: 1, y: -89)
            
            Image("vector1")
                .frame(width: 16, height: 17)
                .offset(x: -5, y: -80)
                
        }

    }
}

