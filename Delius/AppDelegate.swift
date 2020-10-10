//
//  AppDelegate.swift
//  Delius
//
//  Created by 정윤환 on 22/08/2019.
//  Copyright © 2019 정윤환. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseFirestore
import FirebaseAuth
import UserNotifications
import FirebaseDatabase
import FirebaseMessaging
import FirebaseCore
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    var FCMToken : String!
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        window?.backgroundColor = UIColor.white
//        let vc = WelcomeVC()
//        window?.rootViewController = vc
//        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        
        if let currentUser = Auth.auth().currentUser{
            let uid = currentUser.uid
            let firstStr = uid.first!
            let str = firstStr.uppercased()
            let arr1 = ["A","B","C","D","E","F","G","H","I"]
            let arr2 = ["J","K","L","M","N","O","P","Q","R"]
            let arr3 = ["S","T","U","V","W","X","Y","Z","0"]
            let arr4 = ["1","2","3","4","5","6","7","8","9"]
            if arr1.contains(str){
                Database.database(url: "https://delius-46aa7.firebaseio.com/").isPersistenceEnabled = true
                
            }else if arr2.contains(str){
                Database.database(url: "https://delius-46aa7-199bd.firebaseio.com/").isPersistenceEnabled = true
                
            }else if arr3.contains(str){
                Database.database(url: "https://delius-46aa7-39305.firebaseio.com/").isPersistenceEnabled = true
                
            }else if arr4.contains(str){
                Database.database(url: "https://delius-46aa7-ce17b.firebaseio.com/").isPersistenceEnabled = true
                
            }
        }
        Database.database(url: "https://delius-46aa7-da4dc.firebaseio.com/").isPersistenceEnabled = true
        Database.database(url: "https://delius-46aa7-e14a5.firebaseio.com/").isPersistenceEnabled = true
        Database.database(url: "https://delius-46aa7-eb111.firebaseio.com/").isPersistenceEnabled = true
        Database.database(url: "https://delius-46aa7-fef51.firebaseio.com/").isPersistenceEnabled = true
        setInitialView()
        
        
        
        
//        let mainView = UIStoryboard(name: "Main", bundle: nil)
//
//        if Auth.auth().currentUser == nil {
//           let viewcontroller :  WelcomeVC = mainView.inst
//        antiateViewController(withIdentifier: "welcomeVC") as! WelcomeVC
//           self.window!.rootViewController = viewcontroller
//           self.window?.makeKeyAndVisible();
//        } else {
//           let viewcontroller :  RootViewController = mainView.instantiateViewController(withIdentifier: "rootVC") as! RootViewController
//           self.window!.rootViewController = viewcontroller
//           self.window?.makeKeyAndVisible();
//        }
        
        // [START set_messaging_delegate]
        Messaging.messaging().delegate = self
        // [END set_messaging_delegate]
        // Register for remote notifications. This shows a permission dialog on first run, to
        // show the dialog at a more appropriate time move this registration accordingly.
        // [START register_for_notifications]
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        // [END register_for_notifications]
        return true
    }
    
    // [START receive_message]
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    // [END receive_message]
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Unable to register for remote notifications: \(error.localizedDescription)")
    }
    
    // This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
    // If swizzling is disabled then this function must be implemented so that the APNs token can be paired to
    // the FCM registration token.
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("APNs token retrieved: \(deviceToken)")
        
        // With swizzling disabled you must set the APNs token here.
        // Messaging.messaging().apnsToken = deviceToken
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Delius")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func setInitialView(){
        let location = LocationService.initial()
        let photo = PhotoPermissionService.initial()
        let contact = ContactPermissionService.initial()
        
        if !location{
            let vc = PermissionVC()
            self.window!.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        guard let user = Auth.auth().currentUser else {
            let vc = WelcomeVC()
            self.window!.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        let vc = RootVC()
        self.window!.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return
        if let stepIndex = UserDefaults.standard.string(forKey: user.uid){
            if stepIndex == "signupCompleted"{
                let vc = RootVC()
                self.window!.rootViewController = vc
                self.window?.makeKeyAndVisible()
                return
            }
        }
        
//        let vc = CheckUserAccountVC()
//        self.window!.rootViewController = vc
//        self.window?.makeKeyAndVisible()
//        return
        
        
    }
    
}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        // Change this to your preferred presentation option
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        completionHandler()
    }
}
// [END ios_10_message_handling]

extension AppDelegate : MessagingDelegate {
    // [START refresh_token]
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        
        let dataDict:[String: String] = ["token": fcmToken]
        UserDefaults.standard.set(fcmToken,forKey: "fcmToken")
        self.FCMToken = fcmToken
        
        
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    // [END refresh_token]
    // [START ios_10_data_message]
    // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
    // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print("Received data message: \(remoteMessage.appData)")
        Messaging.messaging().shouldEstablishDirectChannel = true


    }
    // [END ios_10_data_message]
}
