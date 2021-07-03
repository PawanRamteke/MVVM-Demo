//
//  LoginModel.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on December 23, 2020

import Foundation

struct LoginModel : Codable {

        let ciLastRegenerate : Int?
        let chatUid : String?
        let createDate : String?
        let email : String?
        let firstname : String?
        let identity : String?
        let lastname : String?
        let loginCount : String?
        let loginType : String?
        let oldLastLogin : String?
        let planCancel : String?
        let planId : String?
        let planStatus : String?
        let profileimage : String?
        let userId : String?
        let userType : String?

        enum CodingKeys: String, CodingKey {
                case ciLastRegenerate = "__ci_last_regenerate"
                case chatUid = "chat_uid"
                case createDate = "create_date"
                case email = "email"
                case firstname = "firstname"
                case identity = "identity"
                case lastname = "lastname"
                case loginCount = "login_count"
                case loginType = "login_type"
                case oldLastLogin = "old_last_login"
                case planCancel = "plan_cancel"
                case planId = "plan_id"
                case planStatus = "plan_status"
                case profileimage = "profileimage"
                case userId = "user_id"
                case userType = "user_type"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                ciLastRegenerate = try values.decodeIfPresent(Int.self, forKey: .ciLastRegenerate)
                chatUid = try values.decodeIfPresent(String.self, forKey: .chatUid)
                createDate = try values.decodeIfPresent(String.self, forKey: .createDate)
                email = try values.decodeIfPresent(String.self, forKey: .email)
                firstname = try values.decodeIfPresent(String.self, forKey: .firstname)
                identity = try values.decodeIfPresent(String.self, forKey: .identity)
                lastname = try values.decodeIfPresent(String.self, forKey: .lastname)
                loginCount = try values.decodeIfPresent(String.self, forKey: .loginCount)
                loginType = try values.decodeIfPresent(String.self, forKey: .loginType)
                oldLastLogin = try values.decodeIfPresent(String.self, forKey: .oldLastLogin)
                planCancel = try values.decodeIfPresent(String.self, forKey: .planCancel)
                planId = try values.decodeIfPresent(String.self, forKey: .planId)
                planStatus = try values.decodeIfPresent(String.self, forKey: .planStatus)
                profileimage = try values.decodeIfPresent(String.self, forKey: .profileimage)
                userId = try values.decodeIfPresent(String.self, forKey: .userId)
                userType = try values.decodeIfPresent(String.self, forKey: .userType)
        }

}
