//
//  ContentView.swift
//  quoteplanet
//
//  Created by Zayn on 4/24/22.
//

import SwiftUI

struct ContentView: View {
	
	@StateObject var vm = HomeViewModal()
	
    var body: some View {
		HomeView(vm: vm)
    }
}
