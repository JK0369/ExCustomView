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
import RxGesture

class ViewController: UIViewController {
  
  private let myCustomView = MyCustomView()
  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.myCustomView)
    self.myCustomView.snp.makeConstraints {
      $0.top.left.right.equalTo(self.view.safeAreaLayoutGuide).inset(32)
    }
    
    self.myCustomView.rx.tapGesture()
      .map { _ in Void() }
      .bind { [weak self] in self?.myCustomView.becomeFirstResponder() }
      .disposed(by: self.disposeBag)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    self.view.endEditing(true)
  }
}
