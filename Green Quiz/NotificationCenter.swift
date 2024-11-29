import UserNotifications

class NotificationManagerGQ: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationManagerGQ()
    
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    
    func createDailyNotification() {
        guard UserDefaults.standard.bool(forKey: "notificationsAvalible") else { return }
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                UserDefaults.standard.set(true, forKey: "notificationsAvalible")
                // Перше повідомлення на 8:30
                let dailyContent = UNMutableNotificationContent()
                
                dailyContent.title = "New Daily Quiz!"
                dailyContent.body = "Don't miss out on today's quiz to test your knowledge!"
                dailyContent.sound = .default
                
                var dateComponents = DateComponents()
                dateComponents.hour = 11
                dateComponents.minute = 00

                let dailyTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                let dailyIdentifier = UUID().uuidString
                let dailyRequest = UNNotificationRequest(identifier: dailyIdentifier, content: dailyContent, trigger: dailyTrigger)

                // Додаємо запит на нотифікацію о 8:30
                UNUserNotificationCenter.current().add(dailyRequest) { error in
                    if let error = error {
                        print("Failed to schedule daily notification: \(error.localizedDescription)")
                    }
                }
                
                // Додаткове повідомлення через 3 хвилини після виклику
                let earlyContent = UNMutableNotificationContent()
                earlyContent.title = "Quiz Coming Soon!"
                earlyContent.body = "Get ready! A new quiz will be available shortly."
                earlyContent.sound = .default
                
                let earlyTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 3 * 60, repeats: false)
                
                let earlyIdentifier = UUID().uuidString
                let earlyRequest = UNNotificationRequest(identifier: earlyIdentifier, content: earlyContent, trigger: earlyTrigger)

                // Додаємо запит на нотифікацію через 3 хвилини
                UNUserNotificationCenter.current().add(earlyRequest) { error in
                    if let error = error {
                        print("Failed to schedule early notification: \(error.localizedDescription)")
                    }
                }
                
            } else {
                UserDefaults.standard.set(false, forKey: "notificationsAvalible")
                print("Permission for notifications was not granted.")
            }
        }
    }
    
    func removePendingNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        print("All scheduled notifications have been removed.")
    }
}
