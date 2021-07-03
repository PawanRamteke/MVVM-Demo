//
//  Observable.swift
//  MVVM
//
//  Created by TIU-User on 23/12/20.
//

import Foundation

class Observable<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind (listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
