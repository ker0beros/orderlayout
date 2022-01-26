//
//  TokenAPI.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 20/01/2022.
//

import Foundation
import Request

class tokenManager: ObservableObject {

    @Published var name: String = ""
    @Published var pages: [Page] = []
    @Published var width: Int = 0
    @Published var height: Int = 0
    private var order: OrderLayout?
//    private let semaphore = DispatchSemaphore(value: 1)
    
    func fetchToken() {
        //URL
        let url: String = "http://itlhub.hq.getslurp.com:3000/oauth/token"
        
        //Specify request body
        let body = [
            "grant_type": "device_code",
            "device_code": "8C3KM4NK",
            "client_id": "4939304e-1b88-4ee4-bdc5-6b831d25f258",
            "client_secret": "O9OGxXjwe8HVSKR9yXZtnCtvkGE8rFjfe6QFAZEY"
        ]
        print("Run fetch token")
        Request{
            Url(url)
            Header.ContentType(.json)
            Method(.post)
            Body(body)
        }
        .onData{
            (data) in
            let resData = try! JSONDecoder().decode(ResponseBody.self, from: data)
            UserDefaults.standard.setToken(token: resData.accessToken)
        }
        .call()
    }
    
    func fetchOrderLayout() {
        //URL
        let url = "http://itlhub.hq.getslurp.com:3000/orderlayout"
        
        //check if token exists
        if (UserDefaults.standard.getToken() != "") {
            Request{
                Url(url)
                Header.Authorization(.bearer(UserDefaults.standard.getToken()))
                Method(.get)
            }
            .onData{ (data) in
                do {
                    let resData = try JSONDecoder().decode(OrderLayout.self, from: data)
                    DispatchQueue.main.async {
                        self.pages = resData.pages
                        self.width = resData.width
                        self.height = resData.height
                    }
                } catch {
                    print("Error in parsing data request")
                }
            }
            .onError({ errors in
                print("Error on fetching request")
            })
            .call()
        } else {
            print("Token is empty")
            self.fetchToken()
//            self.fetchOrderLayout()
        }
    }
    
//    func fetchOrder() {
//        RequestChain {
//            Request.chained { (data, errors) in
//                //URL
//                let url: String = "http://itlhub.hq.getslurp.com:3000/oauth/token"
//
//                //Specify request body
//                let body = [
//                    "grant_type": "device_code",
//                    "device_code": "8C3KM4NK",
//                    "client_id": "4939304e-1b88-4ee4-bdc5-6b831d25f258",
//                    "client_secret": "O9OGxXjwe8HVSKR9yXZtnCtvkGE8rFjfe6QFAZEY"
//                ]
//
//                Url(url)
//                Header.ContentType(.json)
//                Method(.post)
//                Body(body)
//            }
//            Request.chained { (data, errors) in
//                print(data[0]!)
//            }
//        }
//        .call { (data, errors) in
//            //
//        }
//    }
    
    //    func fetchToken(){
    //        let body = [
    //            "grant_type": "device_code",
    //            "device_code": "8C3KM4NK",
    //            "client_id": "4939304e-1b88-4ee4-bdc5-6b831d25f258",
    //            "client_secret": "O9OGxXjwe8HVSKR9yXZtnCtvkGE8rFjfe6QFAZEY"
    //        ]
    //        var _: String = ""
    //
    //            Request{
    //                Url(protocol: .http, url: "itlhub.hq.getslurp.com:3000/oauth/token")
    //                Header.ContentType(.json)
    //                Method(.post)
    //                Body(body)
    //            }
    //            .onData{
    //                (data) in
    //                let resData = try! JSONDecoder().decode(ResponseBody.self, from: data)
    //                self.token = resData.accessToken
    //                print("key: \(self.token)")
    //            }
    //            .call()
    //    }
}

private struct ResponseBody: Codable {
    let accessToken, clientID: String
    let centralID: Int
    let centralName: String
    let outletID: Int
    let tokenType: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case clientID = "client_id"
        case centralID = "central_id"
        case centralName = "central_name"
        case outletID = "outlet_id"
        case tokenType = "token_type"
    }
}

struct Error: Codable {
    let statusCode: Int
    let error, message: String
}
