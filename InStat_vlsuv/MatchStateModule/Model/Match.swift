//
//  Match.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import Foundation

struct Match: Codable {
    var date: String
    var tournament: Tournament
    var team1: Team
    var team2: Team
}
