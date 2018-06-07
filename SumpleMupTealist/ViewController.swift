//
//  ViewController.swift
//  SumpleMupTealist
//
//  Created by アポカリプス・ティア on 2018/06/07.
//  Copyright © 2018年 アポカリプス・ティア. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var derailTextViwer: UITextView!
    @IBOutlet weak var placeMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Plistの場所を探す
        let filePath = Bundle.main.path(forResource: "areaList", ofType: "plist")
        
        //Plistの中身をDictionary型で取り出す
        let dics = NSDictionary(contentsOfFile: filePath!)
        
        print(dics)
        
        for (key,data) in dics! {
        print(key,"と",data) // 確認用
            
            let title = key as! String
            let dic = data as! NSDictionary
            
            //dataの中身を取り出す
            print(dic["description"])
            print(dic["latitude"])
            
            //ピンの設定
            let pin = MKPointAnnotation()
            let latitude = dic["latitude"] as! String
            let longitude = dic["longitude"] as! String
            
            //ピンの位置の値
            //atof(String) Stringから数字に変える関数
            pin.coordinate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
            
            //ピンのタイトル、サブタイトルの設定
            pin.title = title
            pin.subtitle = dic["description"] as! String
            
            //地図に戻す
            placeMapView.addAnnotation(pin)

        }
        
        //地図の設定、中心と表示範囲を指定
        let span = MKCoordinateSpanMake(1,1)
        let centerPin = MKPointAnnotation()
        centerPin.coordinate = CLLocationCoordinate2DMake(35.2749215, 136.9391058)
        //中心の座標
        
        let region = MKCoordinateRegionMake(centerPin.coordinate, span)
        
        placeMapView.setRegion(region, animated: true)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

