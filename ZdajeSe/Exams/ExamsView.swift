//
//  ExamsView.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import SwiftUI

struct ExamsView: View {
    
    @ObservedObject var examsViewModel: ExamsViewModel
    
    var body: some View {
        List {
            ForEach(examsViewModel.examsOverviews) { examOverview in
                Text(examOverview.title)
            }
        }
    }
}

struct ExamsView_Previews: PreviewProvider {
    static var previews: some View {
        ExamsView(examsViewModel: ExamsViewModel())
    }
}
