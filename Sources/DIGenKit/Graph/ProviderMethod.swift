//
//  ProviderMethod.swift
//  DIGenKit
//
//  Created by Yosuke Ishikawa on 2017/09/22.
//

import Foundation

struct ProviderMethod {
    let name: String
    let returnTypeName: String
    let parameters: [Method.Parameter]

    private init?(method: Method) {
        guard method.name.hasPrefix("provide") else {
            // Provide method must have 'provide' prefix.
            return nil
        }

        guard method.returnTypeName != "Void" else {
            // Provide method must return non-void type.
            return nil
        }

        guard !method.isStatic else {
            // Provide method must not be static.
            return nil
        }

        guard !method.isInitializer else {
            // Provide method must not be an initalizer.
            return nil
        }

        name = method.name
        returnTypeName = method.returnTypeName
        parameters = method.parameters
    }
    
    static func providerMethods(inResoverType type: Type) -> [ProviderMethod] {
        guard 
            type.inheritedTypeNames.contains("Resolver") ||
            type.inheritedTypeNames.contains("DIKit.Resolver") else {
            // Type does not conform to 'Resolver' protocol.
            return []
        }
        
        return type.methods.flatMap(ProviderMethod.init(method:))
    }
}
