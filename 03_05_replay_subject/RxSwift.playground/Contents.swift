//: Please build the scheme 'RxSwiftPlayground' first

import RxSwift

example(of: "ReplaySubject") {
    
    /*
        ReplySubject 会接收以前n个值的变化以及之后的所有变化
     */
    
    let disposeBag = DisposeBag()
    
    let subject = ReplaySubject<Int>.create(bufferSize: 3)
    
    subject.onNext(0)
    subject.onNext(1)
    subject.onNext(2)
    subject.onNext(3)
    
    subject.subscribe(onNext: {
        print("first:", $0)
    }).disposed(by: disposeBag)
    
    print("-- after first subscribe --")
    
    subject.onNext(4)
    
    subject.onNext(5)
    
    subject.subscribe(onNext: {
        print("second:", $0)
    }).disposed(by: disposeBag)
    
    print("-- after second subscribe --")
    
    subject.onNext(6)
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
