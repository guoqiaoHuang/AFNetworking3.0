//
//  TestViewController.swift
//  AFNetworking3.0
//
//  Created by shizi on 16/5/14.
//  Copyright © 2016年 黄小黄. All rights reserved.
//

import UIKit
import SnapKit

class TestViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    var table = UITableView();
    var sourceArray  = []{
        didSet  {
            table.reloadData();
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.cyanColor();
        self.title="初探swift";
        table=UITableView();
        
        table.delegate=self;
        table.dataSource=self;
        table.backgroundColor?=UIColor.clearColor();
        let  footerView:UIView;
        footerView=UIView.init(frame: CGRectMake(0, 0, self.view!.frame.size.width, 100));
        footerView.backgroundColor=UIColor.blackColor();
        table.tableFooterView=footerView;
        self.view .addSubview(table);
        table.snp_makeConstraints { make in
            make.edges.equalTo(self.view);
            make.center.equalTo(self.view);
        }
        self.table.registerNib(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "helloSwift");
        self.getdatasourceHome();
        self.navigationItem.rightBarButtonItem=UIBarButtonItem.init(title: "heolloOC", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(TestViewController.open));
    }
    func open() -> Void {
        let homeVC:HomeViewController = HomeViewController.init();
        
//        HomeViewController *homeVC=HomeViewController.init();
        self.navigationController?.pushViewController(homeVC, animated: true);
        
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
            self.sourceArray.arrayByAddingObjectsFromArray(jsonArray as! [AnyObject]);
            self.sourceArray=jsonArray! as! NSArray;
            
            print(jsonArray);
            let tempdic:AnyObject=jsonArray[0];
            print(tempdic.objectForKey("excerpt"));
            print(self.sourceArray.count);
            self.table .reloadData();
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.sourceArray.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let helloSwift = "helloSwift";
        let tempDic:NSDictionary = self.sourceArray[indexPath.row] as! NSDictionary;
//        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: helloSwift);
        let cell = tableView.dequeueReusableCellWithIdentifier(helloSwift) as! HomeTableViewCell
        
        
        cell.time.text=tempDic.objectForKey("date") as? String;
        cell.hot.text=tempDic.objectForKey("date")as? String;
        cell.context.text=tempDic.objectForKey("excerpt")as? String;
        let picStr = tempDic.objectForKey("pic")as? String;
        let data = NSData(contentsOfURL: NSURL(fileURLWithPath: picStr!));
        cell.contextImage.setImageWithId(1, imagePath: picStr!)
        
        return cell;
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        if indexPath.row%2==0 {
//            
//        }else{
//            
//        }
//        return ;
//    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 320;
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
