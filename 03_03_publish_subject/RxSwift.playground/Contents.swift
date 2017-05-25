//: Please build the scheme 'RxSwiftPlayground' first

import RxSwift

example(of: "PublishSubject") {
    
    let disposeBag = DisposeBag()
    
    let subject = PublishSubject<String>()
    
    subject.subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
    
    subject.on(.next("Hello"))
    //  ↑
    //equal
    //  ↓
    subject.onNext("World")
    
//    subject.onCompleted()
//    
//    subject.onNext("subject has completed. so this word wont print")
    
    let newSubscribe = subject.subscribe(onNext: {
        print("> new subscribe:", $0)
    })
    
    subject.onNext("this is new")
    subject.onNext("both subscribes received the next event")
    
    newSubscribe.dispose()
    
    subject.onNext("the newSubscribe has been disposed. so only the first subscribe received this next event")
}

/*:
 Copyright © 2017 Optimac, Inc. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */
