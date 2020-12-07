//
//  ContentView.swift
//  UI-65
//
//  Created by にゃんにゃん丸 on 2020/12/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home :View {
    @State var edes = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
    
    @State var show = false
    @State var selected = ""
    
    @State var min : CGFloat = 0
    
    @State var color:Color = Color(#colorLiteral(red: 0.5182482661, green: 0.2674095517, blue: 0.6663270289, alpha: 1))
    @State var color2:Color = Color(#colorLiteral(red: 0.5182482661, green: 0.7603925848, blue: 0.6663270289, alpha: 1))
    

    var body: some View{
        
        ZStack{
            VStack{
                
                
                ZStack{
                    
                    HStack{
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "line.horizontal.3")
                            
                        })
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()){show.toggle()}
                            
                            
                        }, label: {
                            Image("p1")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                        })
                        
                    }
                    
                    Text("Home")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                .padding()
                .padding(.top,edes!.top)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                
                Spacer(minLength: 0)
                
                Text(selected)
                
                Spacer(minLength: 0)
            }
            
            
            
            
            HStack{
                
                Spacer(minLength: 0)
                
                VStack(alignment:.leading){
                    
                    HStack{
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            withAnimation(.spring()){show.toggle()}
                            
                        }) {
                            
                            Image(systemName: "xmark")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                            
                        }
                        
                    }
                        .padding(.top,edes!.top)
                        .padding()
                        
                        HStack{
                            
                            
                            GeometryReader{reader in
                                
                                Image("p1")
                                    .resizable()
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                                
                                    .onAppear(perform: {
                                        
                                        self.min = reader.frame(in:.global).minY
                                        
                                        
                                    })
                                
                            }
                            .frame(width: 75, height: 75)
                            
                            
                            VStack(alignment: .leading, spacing: 10){
                                
                                
                                Text("Gmail")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text("Gmail@gmail.com")
                                    .fontWeight(.semibold)
                                
                                
                            }
                            
                        }
                        .padding(.horizontal)
                    
                    VStack(alignment:.leading,spacing:10){
                        
                        MenuBotton(image: "house", title: "home",show:$show,selected: $selected)
                        
                        MenuBotton(image: "person", title: "profile",show:$show,selected: $selected)
                        
                        MenuBotton(image: "creditcard", title: "Pay",show:$show,selected: $selected)
                        
                        MenuBotton(image: "gear", title: "Setting",show:$show,selected: $selected)
                        
                        MenuBotton(image: "envelope", title: "Contact",show:$show,selected: $selected)
                        
                        MenuBotton(image: "info.circle", title: "Help",show:$show,selected: $selected)
                        
                        
                    }
                    .padding(.top)
                    .padding(.leading,45)
                    
                        Spacer(minLength: 0)
                        
                    
                        
                    
                    Spacer(minLength: 0)
                    
                    
                }
                .frame(width: width - 100)
                .background(
                    LinearGradient(gradient: Gradient.init(colors: [color,color2]), startPoint: .leading, endPoint: .trailing)
                            
                            .clipShape(CustomShape(min: $min))
                
                )
                
                .offset(x: show ? 0: width - 100 )

            }
            .background(Color.black.opacity(show ? 0.3 : 0))
            
            
            
            
            
            
            
        }
        
        .ignoresSafeArea(.all, edges: .all)
        
        
       
        
    }
}

struct MenuBotton : View {
    
    var image : String
    var title : String
    
    @Binding var show :Bool
    @Binding var selected : String
    
    var body: some View{
        
        Button(action: {
            
            withAnimation(.spring()){
                selected = title
                show.toggle()
                
            }
            
        }) {
            
            HStack(spacing:20){
                Image(systemName: image)
                    .font(.system(size: 25))
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                
                
                
            }
            .padding(.vertical)
            .padding(.trailing)
            
            
            
            
        }
        .padding(.top,UIScreen.main.bounds.height < 750 ? 0: 5)
        .foregroundColor(.white)
        
        
    }
}

struct CustomShape : Shape {
    @Binding var min : CGFloat
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 35, y: rect.height))
            path.addLine(to: CGPoint(x: 35, y: 0))
            
            path.move(to: CGPoint(x: 35, y: min - 15))
            path.addQuadCurve(to: CGPoint(x: 35, y: min + 90) ,control: CGPoint(x: -35, y: min + 35))
        }
    }
}
