//
//  FaramworkGridViewModel.swift
//  faramwork
//
//  Created by jishnu biju on 03/01/24.
//

import Foundation

final class FaramworkGridViewModel: ObservableObject {
    
    @Published var isShowingDetailView = false
    var selectedFramework: Framework? {
        didSet{
            isShowingDetailView = true
        }
    }
}
