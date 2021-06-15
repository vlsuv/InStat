//
//  Match.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//


/*
 
 ["live": 0, "access": 1, "calc": 1, "has_video": 1, "tournament": {
     id = 39;
     "name_eng" = "England. Premier League";
     "name_rus" = "\U0410\U043d\U0433\U043b\U0438\U044f. \U041f\U0440\U0435\U043c\U044c\U0435\U0440-\U043b\U0438\U0433\U0430";
 }, "team2": {
     id = 1026;
     "name_eng" = Southampton;
     "name_rus" = "\U0421\U0430\U0443\U0442\U0433\U0435\U043c\U043f\U0442\U043e\U043d";
     score = 3;
 }, "storage": 0, "sub": 1, "date": 2020-10-17 14:00:00Z, "team1": {
     id = 20;
     "name_eng" = Chelsea;
     "name_rus" = "\U0427\U0435\U043b\U0441\U0438";
     score = 3;
 }]
 
 
 */




import Foundation

struct Match: Codable {
    var date: String
    var tournament: Tournament
    var team1: Team
    var team2: Team
}

struct Tournament: Codable {
    var id: Int
    var name_eng: String
    var name_rus: String
}

struct Team: Codable {
    var id: Int
    var name_eng: String
    var name_rus: String
    var score: Int
}
