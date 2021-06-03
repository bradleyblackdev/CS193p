//
//  ContentView.swift
//  Memorize
//
//  Created by Bradley Black on 5/26/21.
//

import SwiftUI

struct ContentView: View {
    let emojiFlags: [String] = ["🇿🇼", "🇿🇲", "🇾🇪", "🇪🇭", "🇼🇫", "🇻🇳", "🇻🇪", "🇻🇦", "🇻🇺", "🇺🇿", "🇺🇾", "🇺🇸"]
    let emojiHearts: [String] = ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎"]
    let emojiScenes = ["🌁", "🌉", "🌌", "🌃", "🏙", "🌆", "🎆", "🎇", "🌠", "🌄", "🌅", "🏞", "🎑"]
    @State var theme: [String]
    init() {
        theme = emojiFlags.shuffled()
    }
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(theme, id: \.self) { emoji in
                        CardView(content: String(emoji))
                            .aspectRatio(2/3, contentMode: .fill)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack(){
                VStack {Button {
                    theme = emojiFlags.shuffled()
                }
                label: {Text("flags")
                    .font(.title3)}
                Image(systemName: "flag.circle").font(.largeTitle)
                }
                Spacer()
                VStack {Button {
                    theme = emojiHearts.shuffled()
                }
                label: {Text("hearts")
                    .font(.title3)}
                Image(systemName: "heart.circle").font(.largeTitle)
                }
                Spacer()
                VStack {
                    Button {
                        theme = emojiScenes.shuffled()
                    }
                    label: {Text("scenes")
                        .font(.title3)}
                    Image(systemName: "building.2.crop.circle").font(.largeTitle)
                }
            }
        }
        .padding(.horizontal)
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
            .preferredColorScheme(.light)
        ContentView()
            .previewDevice("iPhone 12 mini")
            .preferredColorScheme(.dark)
    }
}
