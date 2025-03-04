//
//  DataSource.swift
//  Interview
//
//  Created by Pavlo Dvorovenko on 04/03/2025.
//

import SwiftUI

private let json = """
[{"id":1,"login":"mojombo"},{"id":2,"login":"defunkt"},{"id":3,"login":"pjhyett"},{"id":4,"login":"wycats"},{"id":5,"login":"ezmobius"},{"id":-1,"login":"ivey"},{"id":7,"login":"evanphx"},{"id":17,"login":"vanpelt"},{"id":18,"login":"wayneeseguin"},{"id":19,"login":"brynary"},{"id":20,"login":"kevinclark"},{"id":21,"login":"technoweenie"},{"id":22,"login":"macournoyer"},{"id":23,"login":"takeo"},{"id":25,"login":"caged"},{"id":26,"login":"topfunky"},{"id":27,"login":"anotherjesse"},{"id":28,"login":"roland"},{"id":29,"login":"lukas"},{"id":30,"login":"fanvsfan"},{"id":31,"login":"tomtt"},{"id":32,"login":"railsjitsu"},{"id":34,"login":"nitay"},{"id":35,"login":"kevwil"},{"id":36,"login":"KirinDave"},{"id":37,"login":"jamesgolick"},{"id":38,"login":"atmos"},{"id":44,"login":"errfree"},{"id":45,"login":"mojodna"},{"id":46,"login":"bmizerany"},{"id":47,"login":"jnewland"},{"id":48,"login":"joshknowles"},{"id":49,"login":"hornbeck"},{"id":50,"login":"jwhitmire"},{"id":51,"login":"elbowdonkey"},{"id":52,"login":"reinh"},{"id":53,"login":"knzconnor"},{"id":68,"login":"bs"},{"id":69,"login":"rsanheim"},{"id":70,"login":"schacon"},{"id":71,"login":"uggedal"},{"id":72,"login":"bruce"},{"id":73,"login":"sam"},{"id":74,"login":"mmower"},{"id":75,"login":"abhay"},{"id":76,"login":"rabble"},{"id":77,"login":"benburkert"},{"id":78,"login":"indirect"},{"id":79,"login":"fearoffish"},{"id":80,"login":"ry"},{"id":81,"login":"engineyard"},{"id":82,"login":"jsierles"},{"id":83,"login":"tweibley"},{"id":84,"login":"peimei"},{"id":85,"login":"brixen"},{"id":87,"login":"tmornini"},{"id":88,"login":"outerim"},{"id":89,"login":"daksis"},{"id":90,"login":"sr"},{"id":91,"login":"lifo"},{"id":92,"login":"rsl"},{"id":93,"login":"imownbey"},{"id":94,"login":"dylanegan"},{"id":95,"login":"jm"},{"id":100,"login":"kmarsh"},{"id":101,"login":"jvantuyl"},{"id":102,"login":"BrianTheCoder"},{"id":103,"login":"freeformz"},{"id":104,"login":"hassox"},{"id":105,"login":"automatthew"},{"id":106,"login":"queso"},{"id":107,"login":"lancecarlson"},{"id":108,"login":"drnic"},{"id":109,"login":"lukesutton"},{"id":110,"login":"danwrong"},{"id":111,"login":"hcatlin"},{"id":112,"login":"jfrost"},{"id":113,"login":"mattetti"},{"id":114,"login":"ctennis"},{"id":115,"login":"lawrencepit"},{"id":116,"login":"marcjeanson"},{"id":117,"login":"grempe"},{"id":118,"login":"peterc"},{"id":119,"login":"ministrycentered"},{"id":120,"login":"afarnham"},{"id":121,"login":"up_the_irons"},{"id":122,"login":"cristibalan"},{"id":123,"login":"heavysixer"},{"id":124,"login":"brosner"},{"id":125,"login":"danielmorrison"},{"id":126,"login":"danielharan"},{"id":127,"login":"kvnsmth"},{"id":128,"login":"collectiveidea"},{"id":129,"login":"canadaduane"},{"id":130,"login":"nate"},{"id":131,"login":"dstrelau"},{"id":132,"login":"sunny"},{"id":133,"login":"dkubb"},{"id":134,"login":"jnicklas"},{"id":135,"login":"richcollins"}]
"""

@Observable class DataSource {

    var favorites: Set<String> = .init()

    var persons: [Person] = {
        let decoder = JSONDecoder()
        return try! decoder.decode([Person].self, from: json.data(using: .utf8)!)
    }()
}

struct Person: Codable {
    var id: Int
    var login: String
}

struct PersonDetails: Codable {
    var name: String
}
