//
//  ViewController.swift
//  content_generation
//
//  Created by nishi kosei on 2017/01/17.
//  Copyright © 2017年 nishi kosei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var timer:NSTimer!
    //主人公
    var characterView: UIView!
    var characterMoveArr: NSArray = ["固定する","横に動く","縦に動く"]
    var characterMoveMode: Int = 0
    
    var enemyView: UIView!
    var enemyMoveArr: NSArray = ["固定する","横に動く","縦に動く"]
    var enemyMoveMode: Int = 0
    
    var attackView: UIView!
    var attackMoveArr: NSArray = ["固定する","横に動く","縦に動く"]
    var attackMoveMode: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let image1:UIImage = UIImage(named:"738.png")!
        characterView = UIImageView(image:image1);
        characterView.center = self.view.center;
        self.view.addSubview(characterView);

        var characterMovePicker:UIPickerView = UIPickerView()
        characterMovePicker.frame = CGRectMake(0,800, self.view.bounds.width/3, 250.0)
        characterMovePicker.delegate = self
        characterMovePicker.dataSource = self
        self.view.addSubview(characterMovePicker)

        // Do any additional setup after loading the view, typically from a nib.
        if timer == nil {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("update:"), userInfo: nil, repeats: true)
            timer.fire()
        }
        
    }
    
    //表示列
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //表示個数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterMoveArr.count
    }
    
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return characterMoveArr[row] as! String
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        characterMoveMode = row
        characterView.center.x = 0
        characterView.center.y = 600
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func update(timer: NSTimer){
        //ここがアニメーションの動きを制御するメソッド
        //スイッチ用の変数を置いて、pickerで制御
        //先にviewDidLoadでUImageを作っておかないとnilの値にアクセスするためエラーになる
        switch characterMoveMode {
        case 1:
            characterView.center = CGPointMake(characterView.center.x + 1,characterView.center.y)
            if (characterView.center.x > self.view.bounds.size.width/4){
                characterView.center = CGPointMake(0, characterView.center.y)
            }
        case 2:
            characterView.center = CGPointMake(characterView.center.x,characterView.center.y + 1)
            if (characterView.center.y > self.view.bounds.size.height){
                characterView.center = CGPointMake(characterView.center.x, 600)
            }
        default: break
            
        }
    }


}

