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
    
    var selectedPost : Post?
    
    
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
        return threads[threadNames[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "PostViewID", for: indexPath) as! PostTableViewCell
        let currentPost = threads["Memes"]![indexPath.item]
        cell.posterName.text = currentPost.poster
        cell.elapsedTime.text = String(DateFormatter().string(from: currentPost.timestamp as Date))
        cell.seenImage.image = #imageLiteral(resourceName: "unread")
        if currentPost.seen {
            cell.seenImage.image = #imageLiteral(resourceName: "read")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentPost = threads["Memes"]![indexPath.item]
        selectedPost = currentPost
        if currentPost.seen {
            return
        }
        currentPost.seen = true
        postTableView.reloadData()
        performSegue(withIdentifier: "ToPic", sender: self)
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //"toPic"
        if let identifier = segue.identifier {
            if identifier == "ToPic" {
                if let dest = segue.destination as? PhotoViewController{
                    if let post = selectedPost {
                        dest.currentPost = post
                    }
                }
            }
        }
    }
    

}
