//
//  Coordinators
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

class Coordinator: NSObject {
    
    var coordinators = [Coordinator]()
    
    func addCoordinator(_ coordinator: Coordinator) {
        self.coordinators.append(coordinator)
    }
    
    func removeCoordinator(_ coordinator: Coordinator) {
        self.coordinators = coordinators.filter { $0 !== coordinator }
    }
    
    func removeAllCoordinators() {
        for coordinator in self.coordinators {
            coordinator.removeAllCoordinators()
        }
        self.coordinators.removeAll()
    }
    
    func start() { }
    
}
