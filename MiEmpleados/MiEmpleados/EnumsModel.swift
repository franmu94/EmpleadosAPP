//
//  EnumsModel.swift
//  MiEmpleados
//
//  Created by Fran Malo on 20/5/24.
//

import Foundation

enum DptoName: String, Codable {
    case accounting = "Accounting"
    case businessDevelopment = "Business Development"
    case engineering = "Engineering"
    case humanResources = "Human Resources"
    case legal = "Legal"
    case marketing = "Marketing"
    case productManagement = "Product Management"
    case researchAndDevelopment = "Research and Development"
    case sales = "Sales"
    case services = "Services"
    case support = "Support"
    case training = "Training"
}


enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}
