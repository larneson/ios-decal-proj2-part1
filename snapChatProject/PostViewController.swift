//
//  PostViewController.swift
//  snapChatProject
//
//  Created by Link Arneson on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var postTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.dataSource = self
        postTableView.delegate = self
        
        
    }

    @IBAction func refreshButtonPressed(_ sender: Any) {
        postTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads["Memes"]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "PostViewID", for: indexPath) as! PostTableViewCell
        let currentPost = threads["Memes"]![indexPath.item]
        cell.posterName.text = currentPost.poster
        cell.elapsedTime.text = String(describing: NSDate.timeIntervalSince(currentPost.timestamp))
        cell.seenImage.image = #imageLiteral(resourceName: "unread")
        if currentPost.seen {
            cell.seenImage.image = #imageLiteral(resourceName: "read")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentPost = threads["Memes"]![indexPath.item]
        if currentPost.seen {
            return
        }
        currentPost.seen = true
        postTableView.reloadData()
        //performSegue(withIdentifier: "toPic", sender: self)
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //"toPic"
    }
    

}
