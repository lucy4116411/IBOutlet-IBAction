//
//  destinyViewController.swift
//  IBOutlet&IBAction
//
//  Created by User on 2019/4/16.
//  Copyright © 2019 Lu. All rights reserved.
//

import UIKit
import Dispatch
class destinyViewController: UIViewController {

    /*let queue = DispatchQueue(label: "com.appcoda.delayqueue",qos: .userInitiated)*/
    // timer : Timer?
    //var oldTime = "00"
    var flag = 0

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var gif: UIImageView!
    let images = [UIImage(named: "0")!,UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!,UIImage(named: "4")!,UIImage(named: "5")!,UIImage(named: "6")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0.1,green:0.8,blue:0,alpha:0.1).cgColor,UIColor(red: 0.7, green: 0.5, blue: 0.2, alpha: 0.2).cgColor]
        view.layer.addSublayer(gradientLayer)
        gif.image = images[0]       // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    

    
    @IBAction func startButton(_ sender: Any) {
        let animateImage = UIImage.animatedImage(with: images, duration: 1)
        
        if(flag == 0){
            output.text = ""
            gif.image = animateImage
            button.setTitle("Stop!", for: [])
            flag = 1
        }
        else{
            let randomNum:Int = Int.random(in: 0...100)
            gif.image = images[0]
            if(randomNum < 15){
                output.text = "Buy"
            }
            else{
                output.text = "Let it Go"
            }
            button.setTitle("GO!", for: [])
            flag = 0
        }
       
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
