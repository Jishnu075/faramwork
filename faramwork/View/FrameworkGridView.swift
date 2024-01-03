//
//  FrameworkGridView.swift
//  faramwork
//
//  Created by jishnu biju on 21/12/23.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FaramworkGridViewModel()
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        FWGridItem(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                        }
                    }
                }
            }.navigationTitle("Frameworks")
                .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                    FrameworkDetailView(framework: viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView)
                })
                
        }
        
    }
}

#Preview {
    FrameworkGridView()
}

struct FWGridItem: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }.padding()
    }
}
