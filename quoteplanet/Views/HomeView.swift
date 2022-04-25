//
//  HomeView.swift
//  quoteplanet
//
//  Created by Zayn on 4/24/22.
//

import SwiftUI

struct HomeView: View {
	
	@ObservedObject var vm: HomeViewModal
	
    var body: some View {
		NavigationView {
		VStack {
			
			List(vm.quotes, id: \.quote_no) { q in
				
				QuoteRow(quote: q)
					.padding(.vertical, 8)
				
					
			}
			.listStyle(.insetGrouped)
			.refreshable {
				vm.getAnotherones()
			}
			
			
			
		}
			
			
			
			
		.navigationTitle("Random Quotes")
		}
		
		
    }
}
