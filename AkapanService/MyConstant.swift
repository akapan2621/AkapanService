//
//  MyConstant.swift
//  AkapanService
//
//  Created by TST-APP-02 on 16/1/2562 BE.
//  Copyright © 2562 Akapan. All rights reserved.
//

import Foundation

class MyConstant {
    
    let urlAddUser: String = "https://www.androidthai.in.th/hit/addUserAke.php?isAdd=true&Name="
    let urlGetUser: String = "https://www.androidthai.in.th/hit/getUserWhereUserAkapan.php?isAdd=true&User="
    func getUrlAddUser() -> String {
        return urlAddUser
    }
    
    func getUrlgetUser(user: String) -> String {
        let result = "\(urlGetUser)\(user)"
        return result
    }
}
