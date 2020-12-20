import UIKit

/*
 Protocol inheritance looks just like class inheritance. We might have protocols to define various jobs that a developer might do: programming, debugging, attending meetings, and so on:
 */
protocol Programming { }
protocol Debugging { }
protocol MeetingAttending { }

/*
 We could then define some types that use those protocols, like this:
 */

struct JuniorDeveloper: Programming, Debugging, MeetingAttending { }
struct SeniorDeveloper: Programming, Debugging, MeetingAttending { }
struct LeadDeveloper: Programming, Debugging, MeetingAttending { }

/*
 Protocol inheritance lets us create a new protocol that combines those existing ones, saving us from repetition and the chance of missing something off. So instead of the above we could write this:
 */

protocol Developer: Programming, Debugging, MeetingAttending { }
struct JuniorDeveloper: Developer { }
struct SeniorDeveloper: Developer { }
struct LeadDeveloper: Developer { }

/*
 Swift also lets us combine two protocols together using a type alias, and in fact that’s exactly how the Codable protocol is implemented:
 */

typealias Codable = Decodable & Encodable

typealias DeveloperProtocol =  Programming & Debugging & MeetingAttending

struct JuniorDeveloper: DeveloperProtocol { }
struct SeniorDeveloper: DeveloperProtocol { }
struct LeadDeveloper: DeveloperProtocol { }

/*
 Even better, Swift lets us use the same syntax for class and subtype existentials, which means we can combine protocols with classes to be even more precise about what we accept.
 */

protocol UserHandling { }

func showUserDetails(on vc: UserHandling & UIViewController) {
   print("done")
}
