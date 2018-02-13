//
//  ActivityViewController.swift
//  Selfiegramm
//
//  Created by Aaron Chong on 10/24/17.
//  Copyright © 2017 ACprojects. All rights reserved.
//

import UIKit

class ActivityViewController: UITableViewController {
    
    var activities = [Activity]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Selfigram-logo"))
    }

    override func viewDidAppear(_ animated: Bool) {
        if let query = Activity.query() {
            query.order(byDescending: "createdAt")

            // we need to get the details inside user (like username). so we include it in this query
            query.includeKey("user")
            // ditto for post.user to get the username of the user that submitted the post.
            query.includeKey("post.user")
            query.findObjectsInBackground(block: { (results, error) in
                if let newActivities = results as? [Activity] {
                    // update our array with new data from Parse
                    self.activities = newActivities
                    // reload the table view so new content shows
                    self.tableView.reloadData()
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)

        // get the specific activity we should configure based on where we are (indexPath.row)
        let activity = activities[indexPath.row]
        
        // get info on the liker and the userBeingLiked
        if let liker = activity.user.username,
            let userBeingLiked = activity.post.user.username{
            cell.textLabel?.text = "❤️" + "\(liker) liked \(userBeingLiked)'s photo"
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
