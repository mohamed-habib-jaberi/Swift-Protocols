import UIKit

//Inspired by: http://merowing.info/2017/04/using-protocol-compositon-for-dependency-injection/

//Protocols for objects owning services. Interactors in VIPER, for example.
protocol HasLogService {
    var logService: LogService { get }
}

protocol HasLoginService {
    var loginService: LoginService { get }
}

//Implementation of services
final class LogService {

    func log() {
        print("LogService works!")
    }
}

final class LoginService {

    func login() {
        print("LoginService works!")
    }
}

//Class that handles all services
final class InteractorDependencies: HasLogService, HasLoginService {

    lazy var logService: LogService = .init()
    lazy var loginService: LoginService = .init()
}

//-----------------------------------------------------------------------------------
//Example of interactor
final class Interactor {

    typealias Dependencies = HasLogService

    let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

let interactor = Interactor(dependencies: InteractorDependencies())

//prints "LogService works!"
interactor.dependencies.logService.log()

//Build error, because the interactor knows nothing about loginService
//interactor.dependencies.loginService.login()
