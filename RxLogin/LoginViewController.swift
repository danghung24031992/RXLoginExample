//
//  ViewController.swift
//  RxLogin
//
//  Created by Dang'S on 7/4/17.
//  Copyright © 2017 OMI. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!

    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind(){
        let emailValid = tfEmail.rx.text.orEmpty.asObservable()
        let passwordValid = tfPassword.rx.text.orEmpty.asObservable()
//        let emailSignal = tfEmail.rx.text.orEmpty.asDriver()
//        let passwordSignal = tfPassword.rx.text.orEmpty.asDriver()
//        
        
        let viewModel = LoginViewModel(emailText: emailValid, passwordText: passwordValid);
        
        viewModel.credentialsValid.map{ $0 }
            .subscribe(onNext: { valid in
                self.btnLogin.isEnabled = valid
            }).addDisposableTo(disposeBag)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

