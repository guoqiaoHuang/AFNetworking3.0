//
//  TestViewController.swift
//  AFNetworking3.0
//
//  Created by shizi on 16/5/14.
//  Copyright © 2016年 黄小黄. All rights reserved.
//

import UIKit

class TestViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    var table = UITableView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.cyanColor();
        self.title="初探swift";
        table=UITableView(frame: self.view.frame);
        table.delegate=self;
        table.dataSource=self;
        table.backgroundColor?=UIColor.clearColor();
        let  footerView:UIView;
        footerView=UIView.init(frame: CGRectMake(0, 0, self.view!.frame.size.width, 100));
        footerView.backgroundColor=UIColor.blackColor();
        table.tableFooterView=footerView;
        self.view .addSubview(table);
        self.getdatasourceHome();
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
    }
//     网络请求数据
    func getdatasourceHome() -> Void {
        getDataFromUrl(API.Home, method: .GET, parameter: nil) {date in
            let dictionary:NSString = String.init(data: date!, encoding: NSUTF8StringEncoding)!;
            print(dictionary);
            let jsonObject3 : AnyObject! = try? NSJSONSerialization
                .JSONObjectWithData(date!, options:NSJSONReadingOptions.AllowFragments);
            print("jsondata\(jsonObject3)" );
//            let jsonObject : AnyObject! = NSJSONSerialization.JSONObjectWithData(date, options: NSJSONReadingOptions.MutableContainers, error: nil
                let object :AnyObject = try! NSJSONSerialization
                    .JSONObjectWithData(date!, options:NSJSONReadingOptions.AllowFragments) as! NSDictionary;
                print(object.objectForKey("count"));
            let jsonArray:AnyObject!=object.objectForKey("posts");
            
            print(jsonArray);
            let tempdic:AnyObject=jsonArray[0];
            print(tempdic.objectForKey("excerpt"));
    
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let helloSwift = "helloSwift";
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: helloSwift);
        cell.textLabel?.text = NSString(format:"%d", indexPath.row) as String;
        cell.detailTextLabel?.text = "baby\(indexPath.row)";
        if indexPath.row%2==0 {
            cell.accessoryType=UITableViewCellAccessoryType.DetailButton;
        }else{
            cell.accessoryType=UITableViewCellAccessoryType.DetailDisclosureButton;
        }
        cell.selectionStyle=UITableViewCellSelectionStyle.Blue;
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row%2==0 {
            
        }else{
            
        }
        return ;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
