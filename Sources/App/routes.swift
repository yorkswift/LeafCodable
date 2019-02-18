import Vapor

public func routes(_ router: Router) throws {
  
    router.get { req -> EventLoopFuture<View> in
        
        guard let simpleCountries = CountriesRepository.getSimpleCountries() else {
            
            return try req.view().render("error")
        
        }
        
        struct CountriesView : Encodable {
            var countries : SimpleCountries
        }
        
        return try req.view().render("countries", CountriesView(countries:simpleCountries))
    
    }

}
