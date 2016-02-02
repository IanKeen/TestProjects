//: Playground - noun: a place where people can play

import UIKit

class RetryFunctor<Parameters, ReturnValue> {
    //MARK: - Private properties
    private let function: (Parameters) -> ReturnValue
    
    //MARK: - Lifecycle
    init(_ function: (Parameters) -> ReturnValue) { self.function = function }
    
    //MARK: - Public
    func execute(params: Parameters) { self.function(params) }
    func retry(params: Parameters, maxTries: Int, condition: (ReturnValue) -> Bool) -> ReturnValue {
        var tries = 0
        var result: ReturnValue
        
        repeat {
            tries++
            result = self.function(params)
        } while (!condition(result) && tries < maxTries)
        
        return result
    }
}

class AsyncRetryFunctor<Parameters, ReturnValue> {
    //MARK: - Private properties
    private let function: (Parameters) -> ReturnValue
    private var tries = 0
    
    //MARK: - Lifecycle
    init(_ function: (Parameters) -> ReturnValue) { self.function = function }
    
    //MARK: - Public
    func execute(params: Parameters) {
        self.function(params)
    }
    func retry(params: Parameters, maxTries: Int, condition: (ReturnValue) -> Bool, closure: (ReturnValue) -> Void) {
        self.tries = 0
        
        repeat {
            self.tries++
            self.function(params)
            
        } while (!condition(result) && self.tries < maxTries)
    }
}

/*
USAGE:
*/
func doSomethingSynchronously(input: String) -> String? {
    return nil //change this to "input" to show success
}
func doSomethingAsynchronous(input: String, result: (String) -> Void) {
    
}


let synchronousOperation = RetryFunctor(doSomethingSynchronously)
let synchronousResult = synchronousOperation.retry("input", maxTries: 3, condition: { return ($0 != nil && $0 == "input") })
print(synchronousResult)



let asyncOperation = AsyncRetryFunctor(doSomethingAsynchronous)
asyncOperation.retry(<#T##params: (String, result: (String) -> Void)##(String, result: (String) -> Void)#>, maxTries: <#T##Int#>, condition: <#T##() -> Bool#>, closure: <#T##() -> Void#>)

