//
//  ViewController.swift
//  homeWork10
//
//  Created by Дмитрий Смирнов on 19.01.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var alarmLabel: UILabel!
    @IBOutlet var volumeLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var setThistimeButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var switchOnOff: UISwitch!
    @IBOutlet var clearButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()

        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            if self.progressView.progress != 1 {
                self.progressView.progress += 0.1
            } else {
                self.alarmLabel.isHidden = false
                self.progressView.isHidden = true
            }
        }
    }

//    @IBAction func sliderAction() {
//        let backgroundColor = view.backgroundColor
//        view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(slider.value))
//        alarmLabel.text = String(slider.value)
//    }
    
    func createProgress(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x, y: view.center.y, width: 150, height: 50)
        progressView.setProgress(0.0, animated: false)
    }


    @IBAction func setTime() {
        let dateFornatter = DateFormatter()
        dateFornatter.dateStyle = .short
        dateFornatter.locale = Locale(identifier: "ru_RU")

        let dateValue = dateFornatter.string(from: datePicker.date)
        alarmLabel.text = dateValue
    }

    @IBAction func swicthAction() {
        alarmLabel.isHidden.toggle()
        slider.isHidden.toggle()
        textField.isHidden.toggle()
        datePicker.isHidden.toggle()
    }

    func setupUI() {
        slider.value = 0.5
        slider.minimumValue = 0
        slider.maximumValue = 1
        //datePicker.locale = Locale.current
        alarmLabel.text = String(slider.value)
        switchOnOff.onTintColor = .green
    }
}

