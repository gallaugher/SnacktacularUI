//
//  Review.swift
//  SnacktacularUI
//  Created by John Gallaugher on 11/26/22
//  YouTube: YouTube.com/profgallaugher, Twitter: @gallaugher

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Review: Identifiable, Codable {
    @DocumentID var id: String?
    var title = ""
    var body = ""
    var rating = 0
    var reviewer = Auth.auth().currentUser?.email ?? ""
    var postedOn = Date()
    
    var dictionary: [String: Any] {
        return ["title": title, "body": body, "rating": rating, "reviewer": reviewer, "postedOn": Timestamp(date: Date())]
    }
}
