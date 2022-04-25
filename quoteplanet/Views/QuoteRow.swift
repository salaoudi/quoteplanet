//
//  QuoteRow.swift
//  quoteplanet
//
//  Created by Zayn on 4/24/22.
//

import SwiftUI

struct QuoteRow: View {
	
	let quote: Quote
	
    var body: some View {
		
		VStack(alignment: .leading) {
			Text(quote.quote_body)
			HStack {
				Text(quote.quote_author)
					.foregroundColor(Color.white)
					.padding(.horizontal, 10)
					.padding(.vertical, 4)
					.background(Color.blue)
					.cornerRadius(100)
				Spacer()
				Text("Source: quotepub")
					.foregroundColor(Color.secondary)
					.padding(.horizontal, 10)
					.padding(.vertical, 4)
					.background(Color(.systemGray6))
					.cornerRadius(100)
			}
			
		}
		
		
		
    }
}
