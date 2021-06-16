//
//  MatchVideo.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 16.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import Foundation

struct MatchVideo: Codable {
    var name: String
    var match_id: Int
    var url: String
    var url_root: String
    var quality: String
    var video_type: String
    var duration: Int
}
