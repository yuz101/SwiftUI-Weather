//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Yuru Zhou on 3/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "San Diego, CA")
                VStack(spacing: 8){
                    MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 25){
                    WeatherDayView(day: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 76)
                    WeatherDayView(day: "WED",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 69)
                    WeatherDayView(day: "THUR",
                                   imageName: "smoke.fill",
                                   temperature: 71)
                    WeatherDayView(day: "FRI",
                                   imageName: "wind",
                                   temperature: 56)
                    WeatherDayView(day: "SAT",
                                   imageName: "wind.snow",
                                   temperature: 54)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label:{
                    weatherButton(btnTitle: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

struct WeatherDayView: View {
    var day: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 16))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size:20))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
struct CityTextView: View{
    var cityName: String
    var body: some View{
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white)
            .padding(40)
    }
}
struct MainWeatherView: View{
    var imageName: String
    var temperature: Int
    var body: some View{
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180,height: 180)
        Text("\(temperature)°")
            .font(.system(size: 50))
            .foregroundColor(.white)
    }
}
struct weatherButton: View{
    var btnTitle: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View{
        Text(btnTitle)
            .frame(width: 280, height: 50, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
