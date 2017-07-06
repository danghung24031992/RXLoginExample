//
//  LoginViewModel.swift
//  RxLogin
//
//  Created by Dang'S on 7/4/17.
//  Copyright © 2017 OMI. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct LoginViewModel{
//    let emailSignal:Driver<String>
//    let passwordSignal :Driver<String>
    
    let credentialsValid: Observable<Bool>
    
    
//    init(emailText:Driver<String> , passwordText:Driver<String>) {
//        let emailValid = emailText
//            .distinctUntilChanged()
//            .throttle(0.3)
//            .map{$0.utf8.count > 3}
//        let passwordValid = passwordText
//            .distinctUntilChanged()
//            .throttle(0.3)
//            .map{ $0.utf8.count > 6 }
//        
//        credentialsValid = Driver.combineLatest(emailValid, passwordValid){ $0 && $1 }
//    }
    
    init(emailText:Observable<String> , passwordText:Observable<String>) {
        let emailValid = emailText
            .distinctUntilChanged()
            .throttle(0.3, scheduler: MainScheduler.instance)
            .map{$0.utf8.count > 3}
        let passwordValid = passwordText
            .distinctUntilChanged()
            .throttle(0.3, scheduler: MainScheduler.instance)
            .map{ $0.utf8.count > 6 }
        
        credentialsValid = Observable.combineLatest(emailValid, passwordValid){ $0 && $1 }
    }
}
