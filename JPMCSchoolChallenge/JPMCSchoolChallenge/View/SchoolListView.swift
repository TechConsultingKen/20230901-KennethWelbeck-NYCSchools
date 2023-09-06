//
//  ContentView.swift
//  JPMCSchoolChallenge
//
//  Created by Kenneth Welbeck on 8/30/23.
//

import SwiftUI

struct SchoolListView: View {
    @StateObject var schoolVM = SchoolViewModel(repository: SchoolRepository(networkManager: NetworkManager()))
    var body: some View {
        VStack {
            switch schoolVM.viewState{
            case .loaded:
                showSchoolList()
            case .loading:
                ProgressView()
            case .errorState:
                showAlertForError()
            case .emptyView:
                showEmptyView()
            }
        }
        .padding()
        .task{
            await schoolVM.getSchoolListFromAPI()
        }
    }
    @ViewBuilder
    func showSchoolList() -> some View {
        if schoolVM.customError != nil{
            Text(schoolVM.customError?.errorDescription ?? "Something Went Wrong")
        } else {
            List{
                ForEach(schoolVM.schoolList["schools"] ?? []){ school in
                        HStack{
                            Text(school.schoolName)
                            Spacer()
                            Text(school.borough)
                        }
                }
            }.listStyle(.inset)
        }
    }
    @ViewBuilder
    func showAlertForError() -> some View {
        Text(schoolVM.customError?.errorDescription ?? "Something Went Wrong")
    }
    @ViewBuilder
    func showEmptyView() -> some View {
        Text("No Schools were called")
    }
}

struct SchoolListView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolListView()
    }
}
