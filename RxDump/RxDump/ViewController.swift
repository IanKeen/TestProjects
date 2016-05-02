//
//  ViewController.swift
//  RxDump
//
//  Created by Ian Keen on 3/05/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum Error: ErrorType {
    case Error
}

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    @IBOutlet private var button: UIButton!
    @IBOutlet private var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button
            .rx_tap
            .flatMap {
                self.operation()
                    .catchErrorJustReturn("Error")
                    .debug()
            }
            .bindTo(self.label.rx_text)
            .addDisposableTo(self.disposeBag)
    }
    
    private func operation() -> Observable<String> {
        return Observable.create { observer in
            let result = Int(arc4random_uniform(UInt32(2)) + UInt32(0))
            
            if (result == 0) {
                observer.onError(Error.Error)
            } else {
                observer.onNext("foo")
                observer.onCompleted()
            }
            
            return NopDisposable.instance
        }
    }
}

