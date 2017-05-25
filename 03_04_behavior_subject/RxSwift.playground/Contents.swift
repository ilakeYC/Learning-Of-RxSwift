//: Please build the scheme 'RxSwiftPlayground' first

import RxSwift

example(of: "BehaviorSubject") {
    
    let disposeBag = DisposeBag()
 
    let subject = BehaviorSubject(value: "a")
    // BehaviorSubject 会接收监听之前的一个事件以及监听之后的事件
    let firstSubscribe = subject.subscribe(onNext: {
        print("first:", $0)
    })
    
    subject.onNext("b")
    
    let secondSubscribe = subject.subscribe(onNext: {
        print("second:", $0)
    })
    
    subject.onNext("c")

    subject.onNext("d")
    
    firstSubscribe.disposed(by: disposeBag)
    secondSubscribe.disposed(by: disposeBag)
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
