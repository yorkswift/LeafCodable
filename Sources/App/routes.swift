import Vapor

public func routes(_ router: Router) throws {
  
    router.get { req -> EventLoopFuture<View> in
        
        
        guard let countries = CountriesRepository.getSimpleCountries() else {
            
            return try req.view().render("error")
        
        }
        
        struct CountriesContext : Encodable {
            var countries : SimpleCountries
        }
        
        return try req.view().render("countries",CountriesContext(countries:countries))
    
    }

}
