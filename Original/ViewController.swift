//
//  ViewController.swift
//  Original
//
//  Created by USER on 2021/02/03.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var mokuhyouTextField: UITextField!
    @IBOutlet var pickerView: UIPickerView!
    var mokuhyou: String!
    
    var restTime: Int = 300
    let restMinitesList = ["5","10","15","20",]

    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        
        if segue.identifier == "toView" {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController;
            resultViewController.mokuhyou = self.mokuhyouTextField.text
            resultViewController.restTime = self.restTime
        }
    }
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return restMinitesList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return restMinitesList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        restTime = Int(restMinitesList[row])! * 60
    }
   //データ変更時の呼び出しメソッド
     @IBAction func changeDate(sender: UIDatePicker) {
     
         let formatter = DateFormatter()
         formatter.dateFormat = "mm分"
//         rest.text = formatter.stringFromDate(sender.DateFormat)

     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backButtonTitle = "戻る"
        self.navigationController!.navigationBar.tintColor = UIColor(red: 0.247, green: 0.247, blue: 0.247, alpha: 1.0)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        mokuhyouTextField.placeholder = "目標を入力 "
        
//        インスタンス化
       let ovalView = DrawView(frame: self.view.bounds)
        
        ovalView.viewX = self.view.bounds.maxX
        ovalView.viewY = self.view.bounds.maxY
//        楕円があるviewを画面上に表示
        self.view.addSubview(ovalView)
//        楕円があるviewを一番下に
        self.view.sendSubviewToBack(ovalView)
        
    }

    @IBOutlet var start:UILabel!
    
    @IBAction func go (){
        performSegue(withIdentifier: "toView", sender: nil)
        
    }
    
    
}


class DrawView: UIView {
        var viewX:CGFloat = 390.0
        var viewY:CGFloat = 870.0

        override init(frame: CGRect){
            super.init(frame: frame);
            self.backgroundColor = UIColor.clear;
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let ovalWidth = viewX * 2
        let ovalHight = viewX * 4 / 3

        let oval = UIBezierPath(ovalIn:CGRect(x: -viewX/2, y:viewY-(ovalHight/2), width: ovalWidth, height: ovalHight))
        
        UIColor(red: 1,green:0.933 ,blue:0.545 ,alpha:1).setFill()
        oval.fill()

    }

}
