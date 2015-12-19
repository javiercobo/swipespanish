//
//  TranslationDictionary.swift
//  SwipeSpanish
//
//  Created by Cobo, Javier on 12/18/15.
//  Copyright © 2015 Cobo, Javier. All rights reserved.
//

import Foundation

let jobsDictionary = [
    "jobNumber" : "1234",
    "jobName" : "Awards Ceremony",
    "client" : "ACME Productions"
]

struct Job {
    var number = 0
    var name = ""
    var client = ""
    var description: String {
        return "Job#: " + number.description + " - name: " + name + " - client: " + client
    }
}

let job = Job(number:  (jobsDictionary["jobNumber"]! as NSString).integerValue, name: jobsDictionary["jobName"]!, client: jobsDictionary["client"]!)

