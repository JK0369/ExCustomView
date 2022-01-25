//
//  ViewController.swift
//  ExCustomView
//
//  Created by Jake.K on 2022/01/26.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  private let myCustomView = MyCustomView()
  private let textField = UITextField().then {
    $0.textColor = .black
    $0.borderStyle = .roundedRect
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.myCustomView)
    self.view.addSubview(self.textField)
    self.myCustomView.snp.makeConstraints {
      $0.top.left.right.equalTo(self.view.safeAreaLayoutGuide).inset(32)
    }
    self.textField.snp.makeConstraints {
      $0.top.equalTo(self.myCustomView.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
    }
  }
}
