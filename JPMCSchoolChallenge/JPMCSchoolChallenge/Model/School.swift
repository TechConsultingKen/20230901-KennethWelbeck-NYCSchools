//
//  School.swift
//  JPMCSchoolChallenge
//
//  Created by Kenneth Welbeck on 8/30/23.
//

import Foundation

struct School: Codable, Identifiable {
    var id: String{
        return dbn
    }
    let dbn, schoolName, boro, overviewParagraph: String
    let academicopportunities1, academicopportunities2, ellPrograms, neighborhood: String
    let buildingCode, location, phoneNumber, faxNumber: String
    let schoolEmail, website, totalStudents, extracurricularActivities: String
    let schoolSports, attendanceRate, city, zip: String
    let stateCode, latitude, longitude, communityBoard: String
    let councilDistrict, borough: String
    let academicopportunities3: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case boro
        case overviewParagraph = "overview_paragraph"
        case academicopportunities1, academicopportunities2
        case ellPrograms = "ell_programs"
        case neighborhood
        case buildingCode = "building_code"
        case location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website
        case totalStudents = "total_students"
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case attendanceRate = "attendance_rate"
        case city, zip
        case stateCode = "state_code"
        case latitude, longitude
        case communityBoard = "community_board"
        case councilDistrict = "council_district"
        case borough, academicopportunities3
    }
}
