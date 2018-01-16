//
//  UserData.swift
//  WorkGuru
//
//  Created by Panupong on 1/16/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import Foundation
import Firebase

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
    
    var type : String! = ""
    var userProfileImage : String! = ""
    var userProfileImage1 : String! = ""
    var userProfileImage2 : String! = ""
    var userProfileImage3 : String! = ""
    var name : String! = ""
    var email : String! = ""
    var work : String! = ""
    var typeOfWork : String! = ""
    var fieldOfWork : String! = ""
    var desiredJobsTitle : String! = ""
    var expectedSalary : String! = ""
    var leaderExperience : String! = ""
    var leaderSkills : String! = ""
    var desiredLeaderAge : String! = ""
    var desiredLeaderGender : String! = ""
    var leaderNationality : String! = ""
    var distance : String! = ""
    var chooseLocation : String! = ""
    var fontSize : String! = ""
    var language : String! = ""
    var about : String! = ""
    var contactInformation : String! = ""
    var company : String! = ""
    var currentWork : String! = ""
    var currentSalary : String! = ""
    var mySkills : String! = ""
    var educationInstitute : String! = ""
    var degree : String! = ""
    var gender : String! = ""
    var dontShowEducation : String! = ""
    var dontShowMyAge : String! = ""
    
    
    func getUserDataDictionary() -> [String: String?]{
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
    
    func setUserData(From data : [String : String]){
        for (key, value) in data{
            switch key {
            case UserDataField.type.rawValue:
                self.type = value
            case UserDataField.userProfileImage.rawValue:
                self.userProfileImage = value
            case UserDataField.userProfileImage1.rawValue:
                self.userProfileImage1 = value
            case UserDataField.userProfileImage2.rawValue:
                self.userProfileImage2 = value
            case UserDataField.userProfileImage3.rawValue:
                self.userProfileImage3 = value
            case UserDataField.name.rawValue:
                self.name = value
            case UserDataField.email.rawValue:
                self.email = value
            case UserDataField.work.rawValue:
                self.work = value
            case UserDataField.typeOfWork.rawValue:
                self.typeOfWork = value
            case UserDataField.fieldOfWork.rawValue:
                self.fieldOfWork = value
            case UserDataField.desiredJobsTitle.rawValue:
                self.desiredJobsTitle = value
            case UserDataField.expectedSalary.rawValue:
                self.expectedSalary = value
            case UserDataField.leaderExperience.rawValue:
                self.leaderExperience = value
            case UserDataField.leaderSkills.rawValue:
                self.leaderSkills = value
            case UserDataField.desiredLeaderAge.rawValue:
                self.desiredLeaderAge = value
            case UserDataField.desiredLeaderGender.rawValue:
                self.desiredLeaderGender = value
            case UserDataField.leaderNationality.rawValue:
                self.leaderNationality = value
            case UserDataField.distance.rawValue:
                self.distance = value
            case UserDataField.chooseLocation.rawValue:
                self.chooseLocation = value
            case UserDataField.fontSize.rawValue:
                self.fontSize = value
            case UserDataField.language.rawValue:
                self.language = value
            case UserDataField.about.rawValue:
                self.about = value
            case UserDataField.contactInformation.rawValue:
                self.contactInformation = value
            case UserDataField.company.rawValue:
                self.company = value
            case UserDataField.currentWork.rawValue:
                self.currentWork = value
            case UserDataField.currentSalary.rawValue:
                self.currentSalary = value
            case UserDataField.mySkills.rawValue:
                self.mySkills = value
            case UserDataField.educationInstitute.rawValue:
                self.educationInstitute = value
            case UserDataField.degree.rawValue:
                self.degree = value
            case UserDataField.gender.rawValue:
                self.gender = value
            case UserDataField.dontShowEducation.rawValue:
                self.dontShowEducation = value
            case UserDataField.dontShowMyAge.rawValue:
                self.dontShowMyAge = value
            default:
                return
            }
        }
    }
    
    func getUserValue(Field field : UserDataField) -> String{
        switch field {
        case UserDataField.type:
            return type
        case UserDataField.userProfileImage:
            return userProfileImage
        case UserDataField.userProfileImage1:
            return userProfileImage1
        case UserDataField.userProfileImage2:
            return userProfileImage2
        case UserDataField.userProfileImage3:
            return userProfileImage3
        case UserDataField.name:
            return name
        case UserDataField.email:
            return email
        case UserDataField.work:
            return work
        case UserDataField.typeOfWork:
            return typeOfWork
        case UserDataField.fieldOfWork:
            return fieldOfWork
        case UserDataField.desiredJobsTitle:
            return desiredJobsTitle
        case UserDataField.expectedSalary:
            return expectedSalary
        case UserDataField.leaderExperience:
            return leaderExperience
        case UserDataField.leaderSkills:
            return leaderSkills
        case UserDataField.desiredLeaderAge:
            return desiredLeaderAge
        case UserDataField.desiredLeaderGender:
            return desiredLeaderGender
        case UserDataField.leaderNationality:
            return leaderNationality
        case UserDataField.distance:
            return distance
        case UserDataField.chooseLocation:
            return chooseLocation
        case UserDataField.fontSize:
            return fontSize
        case UserDataField.language:
            return language
        case UserDataField.about:
            return about
        case UserDataField.contactInformation:
            return contactInformation
        case UserDataField.company:
            return company
        case UserDataField.currentWork:
            return currentWork
        case UserDataField.currentSalary:
            return currentSalary
        case UserDataField.mySkills:
            return mySkills
        case UserDataField.educationInstitute:
            return educationInstitute
        case UserDataField.degree:
            return degree
        case UserDataField.gender:
            return gender
        case UserDataField.dontShowEducation:
            return dontShowEducation
        case UserDataField.dontShowMyAge:
            return dontShowMyAge
        default:
            return ""
        }
    }
    
    func setUserValue(Field field : UserDataField, Values values : [String]){
        var value : String = ""
        
        for i in 0..<values.count{
            switch i{
            case 0:
                value += values[i]
            default:
                value += ", "
                value += values[i]
            }
        }
        
        if let user = Auth.auth().currentUser {
            let ref = Database.database().reference()
            ref.child("users/\(user.uid)/\(field.rawValue)").setValue(value)
        }
        
        switch field.rawValue {
        case UserDataField.type.rawValue:
            self.type = value
        case UserDataField.userProfileImage.rawValue:
            self.userProfileImage = value
        case UserDataField.userProfileImage1.rawValue:
            self.userProfileImage1 = value
        case UserDataField.userProfileImage2.rawValue:
            self.userProfileImage2 = value
        case UserDataField.userProfileImage3.rawValue:
            self.userProfileImage3 = value
        case UserDataField.name.rawValue:
            self.name = value
        case UserDataField.email.rawValue:
            self.email = value
        case UserDataField.work.rawValue:
            self.work = value
        case UserDataField.typeOfWork.rawValue:
            self.typeOfWork = value
        case UserDataField.fieldOfWork.rawValue:
            self.fieldOfWork = value
        case UserDataField.desiredJobsTitle.rawValue:
            self.desiredJobsTitle = value
        case UserDataField.expectedSalary.rawValue:
            self.expectedSalary = value
        case UserDataField.leaderExperience.rawValue:
            self.leaderExperience = value
        case UserDataField.leaderSkills.rawValue:
            self.leaderSkills = value
        case UserDataField.desiredLeaderAge.rawValue:
            self.desiredLeaderAge = value
        case UserDataField.desiredLeaderGender.rawValue:
            self.desiredLeaderGender = value
        case UserDataField.leaderNationality.rawValue:
            self.leaderNationality = value
        case UserDataField.distance.rawValue:
            self.distance = value
        case UserDataField.chooseLocation.rawValue:
            self.chooseLocation = value
        case UserDataField.fontSize.rawValue:
            self.fontSize = value
        case UserDataField.language.rawValue:
            self.language = value
        case UserDataField.about.rawValue:
            self.about = value
        case UserDataField.contactInformation.rawValue:
            self.contactInformation = value
        case UserDataField.company.rawValue:
            self.company = value
        case UserDataField.currentWork.rawValue:
            self.currentWork = value
        case UserDataField.currentSalary.rawValue:
            self.currentSalary = value
        case UserDataField.mySkills.rawValue:
            self.mySkills = value
        case UserDataField.educationInstitute.rawValue:
            self.educationInstitute = value
        case UserDataField.degree.rawValue:
            self.degree = value
        case UserDataField.gender.rawValue:
            self.gender = value
        case UserDataField.dontShowEducation.rawValue:
            self.dontShowEducation = value
        case UserDataField.dontShowMyAge.rawValue:
            self.dontShowMyAge = value
        default:
            return
        }
    }
}
