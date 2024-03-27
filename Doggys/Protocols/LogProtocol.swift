//
//  LogProtocol.swift
//  Doggys
//
//  Created by Marco Muñoz on 27/3/24.
//

protocol LogProtocol {
    func log(screen: String, action: String)
    func crash(screen: String, exception: Error)
}
