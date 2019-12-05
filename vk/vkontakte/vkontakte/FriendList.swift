//
//  FriendList.swift
//  vkontakte
//
//  Created by Администратор on 03.12.2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class FriendList: UITableViewController {

    var friendList = ["Иванов Иван", "Петров Петр", "Сидоров Сидор", "Пупкин Василий"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTemplate", for: indexPath) as! FriendCell
        cell.userName.text = friendList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let username = friendList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "FriendPhotoController") as! FriendPhotoList
        vc.user = username
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
