//
//  Constant.swift
//  MVVM
//
//  Created by TIU-User on 23/12/20.
//

import Foundation
import UIKit

let STORYBOARD = UIStoryboard(name: "Main", bundle: nil)

let BASE_URL                =   "https://www.miilu.com/dev/v7/"

let LOGIN_API               =   BASE_URL + "apps/login"



enum httpMethod:String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}
