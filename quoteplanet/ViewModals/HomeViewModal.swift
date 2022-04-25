//
//  HomeViewModal.swift
//  quoteplanet
//
//  Created by Zayn on 4/24/22.
//

import Foundation

final class HomeViewModal: ObservableObject {
	
	@Published var quotes = [Quote]()
	let networkManager = NetworkManager()

	
	init() {
		getAnotherones()
	}
	
	
	
	func getAnotherones()  {
		
	
		guard let url = URL(string: "https://www.quotepub.com/api/widget/?type=rand&limit=9") else { fatalError("Invalid URL") }

		
		networkManager.request(fromURL: url) { (result: Result<[Quote], Error>) in
			switch result {
			case .success(let quotes):
				print("RESULTS  \(quotes.count) ")
				self.quotes = quotes
			case .failure(let error):
				print("error:  \(error.localizedDescription)")
			}
		 }
		
			
		
	}
		
}
