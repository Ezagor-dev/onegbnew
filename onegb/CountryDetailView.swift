//
//  CountryDetailView.swift
//  onegb
//
//  Created by Ezagor on 14.12.2023.
//

import SwiftUI

struct CountryDetailView: View {
    var country: Country

    var body: some View {
        // Your detail view content here
        Text("Detail view for \(country.name)")
    }
}


