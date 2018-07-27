//
//  DetailedViewController.swift
//  Assignment5
//
//  Created by 北田晴佳 on 2018/05/28.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var randNum: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd", options: 0, locale: Locale.current)
        //print(formatter.string(from: Date())) // 2017年8月12日
        
        let city = City(20.0, formatter.string(from: Date()))
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let imageName = CityViewController.weatherImage[randNum!]
        let imageView = UIImageView(image: imageName)
        
        imageView.center = self.view.center
        imageView.contentMode = .scaleAspectFit
        
        let temperatureLabel: UILabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height - 150, width: 100, height: 50))
        temperatureLabel.text = "\(city.temperature)℃"
        temperatureLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        temperatureLabel.font = temperatureLabel.font.withSize(30)
        temperatureLabel.textAlignment = .center
        
        view.addSubview(imageView)
        view.addSubview(temperatureLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
