//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Ujjawal Kumar Singh on 20/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(isNight : isNight)
            VStack{
                CityName(city: "Delhi, India")
                weatherCityStatus(image: isNight ? "moon.stars.fill" :"cloud.sun.fill", temp: "48°")
                
                HStack(spacing: 25){
                    WeatherDayView(day:"TUE", weatherImage: "cloud.sun.fill",temp: "38°")
                    WeatherDayView(day:"WED", weatherImage: "sun.max.fill",temp: "35°")
                    WeatherDayView(day:"THU", weatherImage: "cloud.sun.fill",temp: "40°")
                    WeatherDayView(day:"FRI", weatherImage: "wind.snow",temp: "25°")
                    WeatherDayView(day:"SAT", weatherImage: "sunset.fill",temp: "34°")
                }
                .padding(.top,50)
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    Text("Change Day Time")
                        .frame(width: 280,height: 50)
                        .background(Color.white)
                        .font(.system(size:20,weight: .medium))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var day : String
    var weatherImage : String
    var temp : String
    var body: some View {
        VStack(spacing:6){
            Text(day)
                .font(.system(size:20,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text(temp)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight : Bool
    
    var body: some View {
        //LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white], startPoint: .topLeading, endPoint: .bottomTrailing)
           // .edgesIgnoringSafeArea(.all)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityName: View {
    var city : String
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct weatherCityStatus: View {
    var image : String
    var temp : String
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180, alignment: .center)
            Text(temp)
                .font(.system(size: 60, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}
