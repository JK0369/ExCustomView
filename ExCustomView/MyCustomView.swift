//
//  MyCustomView.swift
//  ExCustomView
//
//  Created by Jake.K on 2022/01/26.
//

import UIKit
import SnapKit
import Then

final class MyCustomView: UIView {
  private let titleLabel = UILabel().then {
    $0.textColor = .black
    $0.text = "<인풋 커스텀 뷰>"
    $0.font = .systemFont(ofSize: 32)
    $0.textAlignment = .center
  }
  private let inputInformationLabel = UILabel().then {
    $0.textColor = .black
    $0.text = "입력:"
  }
  private let textField = UITextField().then {
    $0.textColor = .black
    $0.borderStyle = .roundedRect
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    self.backgroundColor = .gray.withAlphaComponent(0.3)
    
    [self.titleLabel, self.inputInformationLabel, self.textField]
      .forEach(self.addSubview(_:))
    
    self.titleLabel.snp.makeConstraints {
      $0.top.left.equalToSuperview()
    }
    self.inputInformationLabel.snp.makeConstraints {
      $0.top.equalTo(self.titleLabel.snp.bottom).offset(16)
      $0.left.equalToSuperview()
    }
    self.textField.snp.makeConstraints {
      $0.centerY.equalTo(self.inputInformationLabel.snp.centerY)
      $0.left.equalTo(self.inputInformationLabel.snp.right).offset(8)
      $0.width.equalTo(140)
    }
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @discardableResult
  override func becomeFirstResponder() -> Bool {
    super.becomeFirstResponder()
    return self.textField.becomeFirstResponder()
  }
  
  @discardableResult
  override func resignFirstResponder() -> Bool {
    super.resignFirstResponder()
    return self.textField.resignFirstResponder()
  }
}
