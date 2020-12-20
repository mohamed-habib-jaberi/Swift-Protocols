import UIKit

/*
 Protocol Composition and Dependency Injection
 
 url :
 https://5sw.de/2017/04/protocol-composition-and-dependency-injection/
 */

protocol HasCoreData {
  var coreData: NSPersistentContainer { get }
}

protocol HasListInteractor {
  var listInteractor: ListInteractor { get }
}

final class AppDependencies: HasCoreData, HasListInteractor {
    
 lazy var coreData: NSPersistentContainer = NSPersistentContainer(name: "Whatever")
  lazy var listInteractor: ListInteractor = ListInteractor(dependencies: self)
}

final class ListViewController: UIViewController {
  typealias Dependencies = HasListInteractor
  let dependencies: Dependencies

  init(dependencies: Dependencies) {
    self.dependencies = dependencies
    // ...
  }
}
final class ListInteractor {
  typealias Dependencies = HasCoreData
  let dependencies: Dependencies

  init(dependencies: Dependencies) {
    self.dependencies = dependencies
    // ...
  }
}
