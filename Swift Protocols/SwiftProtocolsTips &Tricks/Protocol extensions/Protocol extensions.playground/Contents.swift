import UIKit

/*
 here’s a simple protocol that logs messages:
 */
protocol NewsProvider {
    func fetchNews() -> [News]
    func applyFilter(filter: Filter)
}

struct ReutersNewsProvider: NewsProvider {
    func fetchNews() -> [News] {
        // implementation
    }
    func applyFilter(filter: Filter) {
        // implementation
    }
}

struct AssociatedPressNewsProvider: NewsProvider {
    func fetchNews() -> [News] {
        // implementation
    }
    func applyFilter(filter: Filter) {
        // implementation
    }
}
/*
 Fetching is different for each news provider (different urls, data parsing,…) but filtering might be identical. Hence to avoid code duplication we move this functionality into the protocol extension:
 
 Any conforming type must implement the applyFilter method, deciding for itself how it should happen. However, we could also add a default implementation that every type will inherit, and will be used if they don’t override it:
 */

protocol NewsProvider {
    func fetchNews() -> [News]
    func applyFilter(filter: Filter)
}

extension NewsProvider {
    func applyFilter(filter: Filter) {
        // implementation
    }
}

struct ReutersNewsProvider: NewsProvider {
    func fetchNews() -> [News] {
        // implementation
    }
}

struct AssociatedPressNewsProvider: NewsProvider {
    func fetchNews() -> [News] {
        // implementation
    }
}

/*
 Now all the data type which conform to NewsProvider get this functionality (applyFilter ) for free, without any duplication of the logic. In case you have some special news provider which needs to use some other filtering logic you can easily redefine it:
 */

struct RussiaTodayNewsProvider: NewsProvider {
    func applyFilter(filter: Filter) {
        // specific implementation... cause you know...
        // these official Russian news agencies require some extra filtering
    }
}
/*
 You can also use protocol extensions to make optional functions in your protocol. Lets say some of the news providers offer a photo feed.
 */
 
protocol NewsProvider {
    //required
    func fetchNews() -> [News]
    // optional
    func fetchPhotos() -> [Photo]?
}

extension NewsProvider {
    func fetchPhotos() -> [Photo]? {
        return nil
    }
}


