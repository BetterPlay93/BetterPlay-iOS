//
//  NotificationsView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 10/2/23.
//

import Foundation

extension NotificationsView {
    class ViewModel: ObservableObject {
        
        @Published var notifications: [NotificationPresentationModel] = []
        
        func getNotifications(){
            let url = "http://127.0.0.1:8000/api/notification/getNotificationsByUser"
            
            NetworkHelper.shared.requestProvider(url: url, type: .GET, token: "ejdolIXN3ejPvy3Kom9znWH0Ipoq2qg4ZsSl8J5j") { data, response, error in
                if let error = error {
                    self.onError(error: error.localizedDescription)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    print(response.statusCode)
                    self.onSuccess(data: data)
                }
            }
        }
        
        func onSuccess(data: Data) {
            do {
                let notificationsResponse = try JSONDecoder().decode(NotificationListResponseModel?.self, from: data)
                
                self.notifications = notificationsResponse?.data?.compactMap({ notification in
                    return NotificationPresentationModel(user_id: notification.user_id ?? 0, text: notification.text ?? "", image: notification.image ?? "", type: notification.type ?? "")
                }) as? [NotificationPresentationModel] ?? []
                
            } catch {
                self.onError(error: error.localizedDescription)
            }
        }
                
        func onError(error: String) {
            print(error)
        }
    }
}
