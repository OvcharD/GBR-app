//
//  ViewController.swift
//  GBR app
//
//  Created by Мак on 04.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var generalView: UIView!
    @IBOutlet var redDescriptionLable: UILabel!
    @IBOutlet var greenDescriptionLable: UILabel!
    @IBOutlet var blueDescriptionLable: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var hexLabel: UILabel!
    @IBOutlet var addCollorButton: UIButton!
    @IBOutlet var collorPatern1Button: UIButton!
    @IBOutlet var collorPatern2Button: UIButton!
    @IBOutlet var collorPatern3Button: UIButton!
    
        override func viewDidLoad() {
        super.viewDidLoad()

        //desc
        generalView.layer.cornerRadius = 20
        generalView.backgroundColor = UIColor(red: 0/200, green: 0/100, blue: 0/255, alpha: 1)
        
        //описание красного слайдера
        redSlider.value = 1
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        //описание зеленого слайда
        greenSlider.value = 1
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        // описание голубого слайдера
        blueSlider.value = 1
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        // описание красного лейбла
        redDescriptionLable.text = " "
        redDescriptionLable.font = redDescriptionLable.font.withSize(25)
        //redDescriptionLable.text = String(Int(redValue))
        //описание зеленого лейбла
        greenDescriptionLable.text = " "
        greenDescriptionLable.font = greenDescriptionLable.font.withSize(25)
        //greenDescriptionLable.text = String(Int(redValue))
        //описание синего лейбла
        blueDescriptionLable.text = " "
        blueDescriptionLable.font = redDescriptionLable.font.withSize(25)
        //blueDescriptionLable.text = String(Int(redValue))
        
        // описание лейбла HEX
        hexLabel.text = "#000000"
        hexLabel.font = hexLabel.font.withSize(25)
        
        // описание addCollor
        addCollorButton.layer.cornerRadius = 20
        
        // описание collorPatern
        collorPatern1Button.layer.cornerRadius = 20
        collorPatern1Button.backgroundColor = UIColor(red:255, green: 255, blue: 255, alpha: 1)
        collorPatern2Button.layer.cornerRadius = 20
        collorPatern2Button.backgroundColor = UIColor(red:255, green: 255, blue: 255, alpha: 1)
        collorPatern3Button.layer.cornerRadius = 20
        collorPatern3Button.backgroundColor = UIColor(red:255, green: 255, blue: 255, alpha: 1)
        
    }
    // переменные для сохранения значений сохранненого цвета
    var pattern1ValueRed = 0
    var pattern1ValueGreen = 0
    var pattern1ValueBlue = 0
    var pattern2ValueRed = 0
    var pattern2ValueGreen = 0
    var pattern2ValueBlue = 0
    var pattern3ValueRed = 0
    var pattern3ValueGreen = 0
    var pattern3ValueBlue = 0
    // переменные для получения значений цвета и конвертации в HEX
    var redValue = 0
    var greenValue = 0
    var blueValue = 0
    //Action
    // Красный слайдер
    @IBAction func redSliderAction(_ sender: Any) { redValue = Int (redSlider.value)
        redDescriptionLable.text = String(Int(redSlider.value))
        generalView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        //заполнение HEX
        hexLabel.text = String("#") + String(format: "%02X", redValue) + String(format: "%02X", greenValue) + String(format: "%02X", blueValue)
    }
    // Зеленый слайдер
    @IBAction func greenSliderAction(_ sender: Any) {
        greenValue = Int(greenSlider.value)
        greenDescriptionLable.text = String(Int(greenValue))
        generalView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        //заполнение HEX
        hexLabel.text = String("#") + String(format: "%02X", redValue) + String(format: "%02X", greenValue) + String(format: "%02X", blueValue)
    }
    // Голубой слайдер
    @IBAction func blueSliderAction(_ sender: Any) {
        blueValue = Int(blueSlider.value)
        blueDescriptionLable.text = String(Int(blueValue))
        generalView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        //заполнение HEX
        hexLabel.text = String("#") + String(format: "%02X", redValue) + String(format: "%02X", greenValue) + String(format: "%02X", blueValue)
    }
    
    var collorCount = 0 // переменная для подбора цвета
    
    @IBAction func addCollorAction(_ sender: Any) {
        if collorCount == 0 {
            collorPatern1Button.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
                pattern1ValueRed = redValue
                pattern1ValueGreen = greenValue
                pattern1ValueBlue = blueValue
                collorCount = 1
        } else if collorCount == 1{
            collorPatern2Button.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
                pattern2ValueRed = redValue
                pattern2ValueGreen = greenValue
                pattern2ValueBlue = blueValue
                collorCount = 2
        } else if collorCount == 2 {
            collorPatern3Button.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
                pattern3ValueRed = redValue
                pattern3ValueGreen = greenValue
                pattern3ValueBlue = blueValue
                collorCount = 0
        }
    }
    
    @IBAction func pattern1Action(_ sender: Any) {
        generalView.backgroundColor = collorPatern1Button.backgroundColor
        redSlider.value = Float(pattern1ValueRed)
        greenSlider.value = Float(pattern1ValueGreen)
        blueSlider.value = Float(pattern1ValueBlue)
        //Добавление значения Хеш
        hexLabel.text = String("#") + String(format: "%02X", pattern1ValueRed) + String(format: "%02X", pattern1ValueGreen) + String(format: "%02X", pattern1ValueBlue)
        
        redDescriptionLable.text = String(pattern1ValueRed)
        greenDescriptionLable.text = String(pattern1ValueGreen)
        blueDescriptionLable.text = String(pattern1ValueBlue)
        
            
    }
    
    @IBAction func pattern2Action(_ sender: Any) {
        generalView.backgroundColor = collorPatern2Button.backgroundColor
        redSlider.value = Float(pattern2ValueRed)
        greenSlider.value = Float(pattern2ValueGreen)
        blueSlider.value = Float(pattern2ValueBlue)
        hexLabel.text = String("#") + String(format: "%02X", pattern2ValueRed) + String(format: "%02X", pattern2ValueGreen) + String(format: "%02X", pattern2ValueBlue)
        
        redDescriptionLable.text = String(pattern2ValueRed)
        greenDescriptionLable.text = String(pattern2ValueGreen)
        blueDescriptionLable.text = String(pattern2ValueBlue)
    }
    
    @IBAction func pattern3Action(_ sender: Any) {
        generalView.backgroundColor = collorPatern3Button.backgroundColor
        redSlider.value = Float(pattern3ValueRed)
        greenSlider.value = Float(pattern3ValueGreen)
        blueSlider.value = Float(pattern3ValueBlue)
        hexLabel.text = String("#") + String(format: "%02X", pattern3ValueRed) + String(format: "%02X", pattern3ValueGreen) + String(format: "%02X", pattern3ValueBlue)
        
        redDescriptionLable.text = String(pattern3ValueRed)
        greenDescriptionLable.text = String(pattern3ValueGreen)
        blueDescriptionLable.text = String(pattern3ValueBlue)
        
    }
}

