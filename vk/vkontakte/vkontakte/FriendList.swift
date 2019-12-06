//
//  FriendList.swift
//  vkontakte
//
//  Created by Администратор on 03.12.2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class FriendList: UITableViewController {
    var friendList = ["А": ["Аверин Артем", "Аитов Аскар"], "Б": ["Борисов Борис", "Баранов Виктор"], "И": ["Иванов Иван"], "П": ["Петров Петр", "Пупкин Василий"], "С": ["Сидоров Сидор"]]
    var objectArray = [Objects]()
    var friendSectionTitles = [String]()

    struct Objects {
        var sectionName: String!
        var sectionObjects: [String]!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let sortedFriends = friendList.sorted() { $0.0 < $1.0 }
        for (key, value) in sortedFriends {
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
            friendSectionTitles.append(key)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTemplate", for: indexPath) as! FriendCell
        cell.userName.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let username = objectArray[indexPath.section].sectionObjects[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "FriendPhotoController") as! FriendPhotoList
        vc.user = username
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendSectionTitles
    }
}
