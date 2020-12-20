import UIKit

/*
 Protocol Composition
 */

protocol HasUserDefaults {
    var userDefaults: UserDefaults { get }
}

protocol HasUrlSession {
    var session: URLSession { get }
}

protocol HasHealthStore {
    var store: HKHealthStore { get }
}

struct Dependencies: HasUserDefaults, HasUrlSession, HasHealthStore {
    let userDefaults: UserDefaults
    let session: URLSession
    let store: HKHealthStore

    init(
        userDefaults: UserDefaults = .standard,
        session: URLSession = .shared,
        store: HKHealthStore = .init()
    ) {
        self.userDefaults = userDefaults
        self.session = session
        self.store = store
    }
}

/*
 Here we have a bunch of protocols which describes our dependencies. Dependencies struct contains all of our dependencies in the app. Generally, we can create and store our Dependencies struct instance in AppDelegate or root Coordinator/FlowController. Now let’s take a look at the usage of our dependency container.
 */

class ViewController: UIViewController {
    typealias Dependencies = HasUserDefaults & HasUrlSession

    private let userDefaults: UserDefaults
    private let session: URLSession

    init(dependencies: Dependencies) {
        userDefaults = dependencies.userDefaults
        session = dependencies.session
        super.init(nibName: nil, bundle: nil)
    }
}
