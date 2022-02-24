//
//  ViewController.swift
//  MVVMExampleWithTimeAPI
//
//  Created by David Yoon on 2022/02/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        
        [yesterdayButton, nowButton, tomorrowButton]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        return stackView
    }()
    
    private lazy var yesterdayButton: UIButton = {
        let button = UIButton()
        button.setTitle("Yesterday", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        return button
    }()
    
    private lazy var nowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Now", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        return button
    }()
    
    private lazy var tomorrowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tomorrow", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setLayoutConstraints()
        NetworkManager().requestTime()
    }
}

private extension ViewController {
    func addSubviews() {
        [timeLabel, buttonHStackView]
            .forEach {
                view.addSubview($0)
            }
    }
    
    func setLayoutConstraints() {
        timeLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(350)
        }
        
        buttonHStackView.snp.makeConstraints{
            $0.top.equalTo(timeLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

