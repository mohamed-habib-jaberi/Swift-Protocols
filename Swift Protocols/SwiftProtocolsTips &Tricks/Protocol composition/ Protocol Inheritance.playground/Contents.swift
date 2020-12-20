import UIKit

/*
 Protocol Inheritance
 In Swift, protocols can inherit from one or more additional protocols. Let’s see how and why to use it.
 */

protocol User1 {
    var id: String { get }
    var name: String { get }
    var lastname: String { get }
    var nickname: String { get set }
    var photo: UIImage? { get set }
    var lastLogin: Date { get set }
    var todos: [Todo] { get set }
}

/*
 Here we have a User protocol, this protocol will be getting bigger each time we add a new User requirement into it. How do we solve this issue? Lets’s use protocol inheritance to make it a little better.
 */


protocol UserIdentity {
    var id: String { get }
    var nickname: String { get set }
    var photo: UIImage? { get set }
}

protocol User: UserIdentity {
    var name: String { get }
    var lastname: String { get }
    var lastLogin: Date { get set }
    var todos: [Todo] { get set }
}

/*
 Then, once we create a type that conforms to the User protocol, we must implement the requirements defined in the User protocol, as well as the requirements defined in the UserIdentity protocol.
 */
struct ActiveUser: User {
    var id: String

    var name: String

    var lastname: String

    var nickname: String

    var lastLogin: Date

    var todos: [Todo]

    var photo: UIImage?

}

