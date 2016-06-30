//
//  ViewModel.swift
//  CompositeDataSource
//
//  Created by Ian Keen on 29/06/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import Foundation

class ViewModel {
    //MARK: - Private Properties
    private let api: API
    
    //MARK: - Lifecycle
    init(api: API) {
        self.api = api
    }
    
    //MARK: - Public
    func sectionOneData(success success: ([Friend]) -> Void, failure: (ErrorType) -> Void) {
        self.api.getFriends(.male, success: success, failure: failure)
    }
    func sectionTwoData(success success: ([Friend]) -> Void, failure: (ErrorType) -> Void) {
        self.api.getFriends(.female, success: success, failure: failure)
    }
}
