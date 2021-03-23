//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Espezzialy Raphael Oliveira Souza on 19/03/21.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    
    
    var body: some View {
        return HStack {
            ForEach(viewModel.cards.shuffled()) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .font(fontSize(numberOfCards: viewModel.cards.count))
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
            RoundedRectangle(cornerRadius: 10.0 ).fill(Color.white)
            RoundedRectangle(cornerRadius: 10.0 ).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0 ).fill()
            }
            
        }
        .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

func fontSize(numberOfCards: Int) -> Font {
    if numberOfCards == 10 {
        return Font.title3
    } else {
        return Font.largeTitle
    }
}
