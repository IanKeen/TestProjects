//: Playground - noun: a place where people can play

import UIKit

class RetryFunctor<Parameters, ReturnValue> {
    //MARK: - Private properties
    private let function: Parameters -> ReturnValue
    
    //MARK: - Lifecycle
    init(_ function: Parameters -> ReturnValue) { self.function = function }
    
    //MARK: - Public
    func execute(params: Parameters) { self.function(params) }
    func retry(params: Parameters, maxTries: Int, condition: (ReturnValue) -> Bool) -> ReturnValue {
        var tries = 0
        var result: ReturnValue
        
        do {
            tries++
            result = self.function(params)
        } while (!condition(result) && tries < maxTries)
        
        return result
    }
}

/*
USAGE:
*/
func doSomethingSynchronously(input: String) -> String? {
    return nil //change this to "input" to show success
}
let synchronousOperation = RetryFunctor(doSomethingSynchronously)
let synchronousResult = synchronousOperation.retry("input", maxTries: 3, condition: { return ($0 != nil && $0 == "input") })
println(synchronousResult)
