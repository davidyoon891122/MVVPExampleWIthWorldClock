//
//  Logic.swift
//  MVVMExampleWithTimeAPI
//
//  Created by David Yoon on 2022/02/24.
//

import Foundation

class Service {
    
    let repository = Repository()
    
    var currentModel = Model(currentDateTime: Date())
    
    func fetchNow(completionHandler: @escaping (Model) -> Void) {
        repository.fetchNow { [weak self] entity in
            guard let self = self else { return }
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
            
            guard let now = formatter.date(from: entity.currentDateTime) else { return }
            
            let model = Model(currentDateTime: now)
            self.currentModel = model
            completionHandler(model)
        }
    }
    
    func moveDay(day: Int) {
        guard let movedDay = Calendar.current.date(byAdding: .day, value: day, to: currentModel.currentDateTime) else { return }
        currentModel.currentDateTime = movedDay
    }
    
}
