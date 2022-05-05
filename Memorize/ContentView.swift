import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚀", "🛳", "🚁", "🚔"]
    @State var emojiCount = 4
    
    var body: some View {
        return VStack {
            VStack {
                LazyVGrid (columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                    }.aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }.padding()
        }
        .padding()
    }
    
    var add: some View {
        Button {
            if (emojiCount < emojis.count) {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.app")
        }.font(.largeTitle)
    }
    
    var remove: some View {
        Button {
            if (emojiCount > 1) {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.square")
        }.font(.largeTitle)
    }

}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            let shape = RoundedRectangle(cornerRadius: 20)
            if (isFaceUp) {
                shape.stroke(lineWidth: 3).fill()
                shape.fill().foregroundColor(.white)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }).onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
