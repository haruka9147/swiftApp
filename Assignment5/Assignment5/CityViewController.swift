//
//  CityViewController.swift
//  Assignment5
//
//  Created by 北田晴佳 on 2018/05/28.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    static let weatherImage = [#imageLiteral(resourceName: "weather2"), #imageLiteral(resourceName: "weather1"), #imageLiteral(resourceName: "weather3"), #imageLiteral(resourceName: "weather4")]
    var rand: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        rand = Int(arc4random_uniform(4))
        let imageName = CityViewController.weatherImage[rand!]
        let imageView = UIImageView(image: imageName)
        
        imageView.center = self.view.center
        imageView.contentMode = .scaleAspectFit
        
        let button: UIButton = UIButton(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height - 150, width: 100, height: 50))
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Detail", for: .normal)
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
        //button.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        view.addSubview(imageView)
        view.addSubview(button)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func pushToNextVC() {
        let newVC = DetailedViewController()
        newVC.randNum = rand!
        self.navigationController?.pushViewController(newVC, animated:
            true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let navVC = segue.destination as! UINavigationController
//        let nextVC = navVC.viewControllers.first as!
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
