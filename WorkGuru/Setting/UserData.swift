//
//  UserData.swift
//  WorkGuru
//
//  Created by Panupong on 1/16/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import Foundation

enum UserDataField: String{
    case type
    case userProfileImage
    case userProfileImage1
    case userProfileImage2
    case userProfileImage3
    case name
    case email
    case work
    case typeOfWork
    case fieldOfWork
    case desiredJobsTitle
    case expectedSalary
    case leaderExperience
    case leaderSkills
    case desiredLeaderAge
    case desiredLeaderGender
    case leaderNationality
    case distance
    case chooseLocation
    case fontSize
    case language
    case about
    case contactInformation
    case company
    case currentWork
    case currentSalary
    case mySkills
    case educationInstitute
    case degree
    case gender
    case dontShowEducation
    case dontShowMyAge
}

class UserData{
    
    var type : String!
    var userProfileImage : String!
    var userProfileImage1 : String!
    var userProfileImage2 : String!
    var userProfileImage3 : String!
    var name : String!
    var email : String!
    var work : String!
    var typeOfWork : String!
    var fieldOfWork : String!
    var desiredJobsTitle : String!
    var expectedSalary : String!
    var leaderExperience : String!
    var leaderSkills : String!
    var desiredLeaderAge : String!
    var desiredLeaderGender : String!
    var leaderNationality : String!
    var distance : String!
    var chooseLocation : String!
    var fontSize : String!
    var language : String!
    var about : String!
    var contactInformation : String!
    var company : String!
    var currentWork : String!
    var currentSalary : String!
    var mySkills : String!
    var educationInstitute : String!
    var degree : String!
    var gender : String!
    var dontShowEducation : String!
    var dontShowMyAge : String!
    
    
    func getUserData() -> [String: String?]{
        let userData = [UserDataField.type.rawValue : type,
                        UserDataField.userProfileImage.rawValue : userProfileImage,
                        UserDataField.userProfileImage1.rawValue : userProfileImage1,
                        UserDataField.userProfileImage2.rawValue : userProfileImage2,
                        UserDataField.userProfileImage3.rawValue : userProfileImage3,
                        UserDataField.name.rawValue : name,
                        UserDataField.email.rawValue : email,
                        UserDataField.work.rawValue : work,
                        UserDataField.typeOfWork.rawValue : typeOfWork,
                        UserDataField.fieldOfWork.rawValue : fieldOfWork,
                        UserDataField.desiredJobsTitle.rawValue : desiredJobsTitle,
                        UserDataField.expectedSalary.rawValue : expectedSalary,
                        UserDataField.leaderExperience.rawValue : leaderExperience,
                        UserDataField.leaderSkills.rawValue : leaderSkills,
                        UserDataField.desiredLeaderAge.rawValue : desiredLeaderAge,
                        UserDataField.desiredLeaderGender.rawValue : desiredLeaderGender,
                        UserDataField.leaderNationality.rawValue : leaderNationality,
                        UserDataField.distance.rawValue : distance,
                        UserDataField.chooseLocation.rawValue : chooseLocation,
                        UserDataField.fontSize.rawValue : fontSize,
                        UserDataField.language.rawValue : language,
                        UserDataField.about.rawValue : about,
                        UserDataField.contactInformation.rawValue : contactInformation,
                        UserDataField.company.rawValue : company,
                        UserDataField.currentWork.rawValue : currentWork,
                        UserDataField.currentSalary.rawValue : currentSalary,
                        UserDataField.mySkills.rawValue : mySkills,
                        UserDataField.educationInstitute.rawValue : educationInstitute,
                        UserDataField.degree.rawValue : degree,
                        UserDataField.gender.rawValue : gender,
                        UserDataField.dontShowEducation.rawValue : dontShowEducation,
                        UserDataField.dontShowMyAge.rawValue : dontShowMyAge,
                        ]
        return userData
    }
    
    
}
