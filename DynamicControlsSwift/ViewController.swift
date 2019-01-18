//
//  ViewController.swift
//  DynamicControlsSwift
//
//  Created by MAC OS on 6/15/17.
//  Copyright © 2017 MAC OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource {

    var arr = ["apple","iphone","ios","mac"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Button
        let button = UIButton(type: UIButtonType.roundedRect);
        
        button.frame = CGRect(x: 100, y: 10, width: 100, height: 40);
        button.addTarget(self, action: #selector(self.test), for: UIControlEvents.touchUpInside);
        button.setTitle("click", for: UIControlState.normal);
        button.backgroundColor = .red;
        
        self.view.addSubview(button);
        
        //Textbox
        let firstname = UITextField(frame: CGRect(x: 100, y: 100, width: 100, height: 40));
        
        firstname.placeholder = "enter name";
        firstname.layer.cornerRadius = 10;
        firstname.clipsToBounds = true;
        firstname.layer.borderWidth = 2.0;
        firstname.layer.borderColor = UIColor.blue.cgColor;
        
        self.view .addSubview(firstname);
        
        //Slider
        let sld = UISlider(frame: CGRect(x: 50, y: 200, width: 100, height: 30));
        
        sld.maximumValue  = 100;
        sld.minimumValue  = 0;
        
        sld.addTarget(self, action: #selector(self.sldchange), for: UIControlEvents.valueChanged);
        self.view .addSubview(sld);
        
        //Switch
        let swt = UISwitch(frame: CGRect(x: 50, y: 300, width: 100, height: 40));
        
        swt.addTarget(self, action: #selector(self.swtaction), for: UIControlEvents.valueChanged)
        
        self.view .addSubview(swt);
        
        //TableView
        let tbl = UITableView(frame: CGRect(x: 10, y: 400, width: 100, height: 300));
        
        tbl.dataSource = self;
        tbl.delegate = self;
        
        self.view .addSubview(tbl);
        
        //PickerView
        let pick = UIPickerView(frame: CGRect(x: 10, y: 200, width: 100, height: 100));
        
        pick.dataSource = self;
        pick.delegate = self;
        
        self.view.addSubview(pick);
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test(sender:UIButton)  {
        
        print("clicked");
    }
    
    func swtaction(sender:UISwitch) {
        
        if sender.isOn
        {
            print("on");
        }
        else
        {
            print("off");
        }
    }
    
    func sldchange(sender:UISlider) {
        
        print(sender.value);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        cell.textLabel?.text =  arr[indexPath.row];
        
        return cell;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1;
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return arr.count;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return  arr[row];
    }
}

