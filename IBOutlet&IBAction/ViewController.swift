//
//  ViewController.swift
//  IBOutlet&IBAction
//
//  Created by User on 2019/4/15.
//  Copyright © 2019 Lu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UITextFieldDelegate{

    
    @IBOutlet weak var discountSwitch: UISwitch!
    @IBOutlet weak var nesSwitch: UISwitch!
    @IBOutlet weak var spendSlider: UISlider!
    @IBOutlet weak var typeSegment: UISegmentedControl!
    @IBOutlet weak var textFieldOfMoney: UITextField!
    @IBOutlet weak var todayDate: UIDatePicker!
    @IBOutlet weak var showMoney: UILabel!
    @IBOutlet weak var image: SubImageView!
    
    @IBOutlet weak var stateLabel: UILabel!
    var dayOfMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    
    let images00 = [UIImage(named: "frame_0_delay-0.1s")!,UIImage(named: "frame_1_delay-0.1s")!,UIImage(named: "frame_2_delay-0.1s")!,UIImage(named: "frame_3_delay-0.1s")!,UIImage(named: "frame_4_delay-0.1s")!,UIImage(named: "frame_5_delay-0.1s")!]
    
    let images01 = [UIImage(named: "frame_00_delay-0.1s")!,UIImage(named: "frame_01_delay-0.1s")!,UIImage(named: "frame_02_delay-0.1s")!,UIImage(named: "frame_03_delay-0.1s")!,UIImage(named: "frame_04_delay-0.1s")!,UIImage(named: "frame_05_delay-0.1s")!,UIImage(named: "frame_06_delay-0.1s")!,UIImage(named: "frame_07_delay-0.1s")!,UIImage(named: "frame_08_delay-0.1s")!,UIImage(named: "frame_09_delay-0.1s")!,UIImage(named: "frame_10_delay-0.1s")!,UIImage(named: "frame_11_delay-0.1s")!,UIImage(named: "frame_12_delay-0.1s")!,UIImage(named: "frame_13_delay-0.1s")!]
    
    let images02 = [UIImage(named: "frame_000_delay-0.1s")!,UIImage(named: "frame_001_delay-0.1s")!,UIImage(named: "frame_002_delay-0.1s")!,UIImage(named: "frame_003_delay-0.1s")!]
    
    let images03 = [UIImage(named: "frame_00_delay-0.04s")!,UIImage(named: "frame_01_delay-0.04s")!,UIImage(named: "frame_02_delay-0.04s")!,UIImage(named: "frame_03_delay-0.04s")!,UIImage(named: "frame_04_delay-0.04s")!,UIImage(named: "frame_05_delay-0.04s")!,UIImage(named: "frame_06_delay-0.04s")!,UIImage(named: "frame_07_delay-0.04s")!,UIImage(named: "frame_08_delay-0.04s")!,UIImage(named: "frame_09_delay-0.04s")!,UIImage(named: "frame_10_delay-0.04s")!,UIImage(named: "frame_11_delay-0.04s")!]
    
    let images04 = [UIImage(named:"frame_0_delay-0.1s-1")!,UIImage(named:"frame_1_delay-0.1s-1")!,UIImage(named:"frame_2_delay-0.1s-1")!,UIImage(named:"frame_3_delay-0.1s-1")!,UIImage(named:"frame_4_delay-0.1s-1")!,UIImage(named:"frame_5_delay-0.1s-1")!,UIImage(named:"frame_6_delay-0.2s-1")!,UIImage(named:"frame_7_delay-0.1s-1")!,UIImage(named:"frame_8_delay-0.5s-1")!]
    
    
    var looper : AVPlayerLooper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldOfMoney.delegate = self
        // Do any additional setup after loading the view, typically from a nib.s
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0.1,green:0.8,blue:0,alpha:0.1).cgColor,UIColor(red: 0.7, green: 0.5, blue: 0.2, alpha: 0.2).cgColor]
        view.layer.addSublayer(gradientLayer)
        
        if let url = URL(string: "https://bit.ly/2GiQV0x"){
            let player = AVQueuePlayer()
            let item = AVPlayerItem(url: url)
            looper = AVPlayerLooper(player: player, templateItem: item)
            player.play()
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func returnMonth() ->Int{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let month:String = dateFormatter.string(from: todayDate.date)
        return Int(month)!
    }
    func returnDay() ->Int{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let day:String = dateFormatter.string(from: todayDate.date)
        print(day)
        return Int(day)!
    }
    
    func returnMoney()->Int{
        let remainMoney:String = textFieldOfMoney.text!
        return Int(remainMoney)!
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        sender.value.round()
        showMoney.text = "$"+Int(sender.value).description
    }
    
    @IBAction func sendImforButton(_ sender: Any) {
        let spend:Int = Int(spendSlider.value)
        let moneyOfremainDay:Double = Double(returnMoney())/Double(dayOfMonth[returnMonth()-1]-returnDay())
        if(moneyOfremainDay < 150.0)&&typeSegment.selectedSegmentIndex != 0{
            print("吃就不夠了買什麼奇怪的東西")
            stateLabel.text = "吃就不夠了買什麼奇怪的東西"
            let animateImage = UIImage.animatedImage(with: images02, duration: 1)
            image.image = animateImage
        }
        else{
            if(typeSegment.selectedSegmentIndex==0){
                if(Double(spend) > moneyOfremainDay ){
                    print("一餐就把一天的錢吃完囉你敢嗎？")
                    stateLabel.text = "一餐就把一天的錢吃完囉你敢嗎？"
                    let animateImage = UIImage.animatedImage(with: images02, duration: 1)
                    image.image = animateImage
                }
                else{
                    print("好好吃飯 好好長大")
                    stateLabel.text = "好好吃飯 好好長大"
                    let animateImage = UIImage.animatedImage(with: images01, duration: 1)
                    image.image = animateImage
                }
            }
            if(typeSegment.selectedSegmentIndex==1)||(typeSegment.selectedSegmentIndex==2){
                if(nesSwitch.isOn==true){
                    print("別騙我了 這必需品？")
                    stateLabel.text = "別騙我了 這必需品？"
                    let animateImage = UIImage.animatedImage(with: images04, duration: 1)
                    image.image = animateImage
                }
                else{
                    if(Double(spend) < moneyOfremainDay * 1.5 ){
                        print("OKOK")
                        stateLabel.text = "OKOK"
                        let animateImage = UIImage.animatedImage(with: images00, duration: 1)
                        image.image = animateImage
                    }
                    else if(Double(spend) < moneyOfremainDay * 3.0){
                        if(discountSwitch.isOn==true){
                            print("既然都打折了 此時不買更待何時")
                            stateLabel.text = "既然都打折了 此時不買更待何時"
                            let animateImage = UIImage.animatedImage(with: images00, duration: 1)
                            image.image = animateImage
                        }
                        else{
                            print("好好思考 可能該吃泡麵了")
                            stateLabel.text = "好好思考 可能該吃泡麵了"
                            let animateImage = UIImage.animatedImage(with: images02, duration: 1)
                            image.image = animateImage
                        }
                    }
                    else{
                        print("想都別想 給我去賺錢再說")
                        stateLabel.text = "想都別想 給我去賺錢再說"
                        let animateImage = UIImage.animatedImage(with: images02, duration: 1)
                        image.image = animateImage
                    }
                }
            }
            if(typeSegment.selectedSegmentIndex==3){
                if(nesSwitch.isOn==true){
                    print("你是有幾張臉可以化? 再騙啊")
                    stateLabel.text = "你是有幾張臉可以化? 再騙啊"
                    let animateImage = UIImage.animatedImage(with: images04, duration: 1)
                    image.image = animateImage
                }
                else{
                    if(Double(spend) < moneyOfremainDay * 3.0){
                        if(discountSwitch.isOn==true){
                            print("你先去試用 好用趁打折買了吧")
                            stateLabel.text = "你先去試用 好用趁打折買了吧"
                            let animateImage = UIImage.animatedImage(with: images00, duration: 1)
                            image.image = animateImage
                        }
                        else{
                            print("別別別 想想你桌上那些")
                            stateLabel.text = "別別別 想想你桌上那些"
                            let animateImage = UIImage.animatedImage(with: images02, duration: 1)
                            image.image = animateImage
                        }
                    }
                    else{
                        print("NONONO")
                        stateLabel.text = "NONONO"
                        let animateImage = UIImage.animatedImage(with: images02, duration: 1)
                        image.image = animateImage
                    }
                }
            }
            if(typeSegment.selectedSegmentIndex==4){
                if(Double(spend) > moneyOfremainDay){
                    print("哇你是要去哪裡那麼貴?")
                    stateLabel.text = "哇你是要去哪裡那麼貴?"
                    let animateImage = UIImage.animatedImage(with: images03, duration: 1)
                    image.image = animateImage
                }
                else{
                    print("去吧去吧")
                    stateLabel.text = "去吧去吧"
                    let animateImage = UIImage.animatedImage(with: images01, duration: 1)
                    image.image = animateImage
                }
            }
            if(typeSegment.selectedSegmentIndex==5){
                if(nesSwitch.isOn==true){
                    print("Buy it,cause you need it!")
                    stateLabel.text = "Buy it,cause you need it!"
                    let animateImage = UIImage.animatedImage(with: images01, duration: 1)
                    image.image = animateImage
                }
                else{
                    print("Let it Go")
                    stateLabel.text = "Let it Go"
                    let animateImage = UIImage.animatedImage(with: images02, duration: 1)
                    image.image = animateImage
                }
            }
        }
    }
    

}

