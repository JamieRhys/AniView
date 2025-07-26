// MARK: - Mocks generated from file: 'AniView/Core/Data/Remote/Client/NetworkClientProtocol.swift'

import Cuckoo
import Foundation
import Alamofire
@testable import AniView

class MockNetworkClientProtocol: NetworkClientProtocol, Cuckoo.ProtocolMock, @unchecked Sendable {
    typealias MocksType = NetworkClientProtocol
    typealias Stubbing = __StubbingProxy_NetworkClientProtocol
    typealias Verification = __VerificationProxy_NetworkClientProtocol

    // Original typealiases

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    private var __defaultImplStub: (any NetworkClientProtocol)?

    func enableDefaultImplementation(_ stub: any NetworkClientProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    
    func request<T: Codable> (url p0: URL, headers p1: HTTPHeaders?, method p2: HTTPMethod, type p3: T.Type, completion p4: @escaping (Result<T, Error>) -> Void) {
        return cuckoo_manager.call(
            "request<T: Codable> (url p0: URL, headers p1: HTTPHeaders?, method p2: HTTPMethod, type p3: T.Type, completion p4: @escaping (Result<T, Error>) -> Void)",
            parameters: (p0, p1, p2, p3, p4),
            escapingParameters: (p0, p1, p2, p3, p4),
            superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall(),
            defaultCall: __defaultImplStub!.request(url: p0, headers: p1, method: p2, type: p3, completion: p4)
        )
    }

    struct __StubbingProxy_NetworkClientProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        func request<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable, M5: Cuckoo.Matchable, T: Codable>(url p0: M1, headers p1: M2, method p2: M3, type p3: M4, completion p4: M5) -> Cuckoo.ProtocolStubNoReturnFunction<(URL, HTTPHeaders?, HTTPMethod, T.Type,  (Result<T, Error>) -> Void)> where M1.MatchedType == URL, M2.OptionalMatchedType == HTTPHeaders, M3.MatchedType == HTTPMethod, M4.MatchedType == T.Type, M5.MatchedType ==  (Result<T, Error>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(URL, HTTPHeaders?, HTTPMethod, T.Type,  (Result<T, Error>) -> Void)>] = [wrap(matchable: p0) { $0.0 }, wrap(matchable: p1) { $0.1 }, wrap(matchable: p2) { $0.2 }, wrap(matchable: p3) { $0.3 }, wrap(matchable: p4) { $0.4 }]
            return .init(stub: cuckoo_manager.createStub(for: MockNetworkClientProtocol.self,
                method: "request<T: Codable> (url p0: URL, headers p1: HTTPHeaders?, method p2: HTTPMethod, type p3: T.Type, completion p4: @escaping (Result<T, Error>) -> Void)",
                parameterMatchers: matchers
            ))
        }
    }

    struct __VerificationProxy_NetworkClientProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        
        @discardableResult
        func request<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable, M5: Cuckoo.Matchable, T: Codable>(url p0: M1, headers p1: M2, method p2: M3, type p3: M4, completion p4: M5) -> Cuckoo.__DoNotUse<(URL, HTTPHeaders?, HTTPMethod, T.Type,  (Result<T, Error>) -> Void), Void> where M1.MatchedType == URL, M2.OptionalMatchedType == HTTPHeaders, M3.MatchedType == HTTPMethod, M4.MatchedType == T.Type, M5.MatchedType ==  (Result<T, Error>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(URL, HTTPHeaders?, HTTPMethod, T.Type,  (Result<T, Error>) -> Void)>] = [wrap(matchable: p0) { $0.0 }, wrap(matchable: p1) { $0.1 }, wrap(matchable: p2) { $0.2 }, wrap(matchable: p3) { $0.3 }, wrap(matchable: p4) { $0.4 }]
            return cuckoo_manager.verify(
                "request<T: Codable> (url p0: URL, headers p1: HTTPHeaders?, method p2: HTTPMethod, type p3: T.Type, completion p4: @escaping (Result<T, Error>) -> Void)",
                callMatcher: callMatcher,
                parameterMatchers: matchers,
                sourceLocation: sourceLocation
            )
        }
    }
}

class NetworkClientProtocolStub:NetworkClientProtocol, @unchecked Sendable {


    
    func request<T: Codable> (url p0: URL, headers p1: HTTPHeaders?, method p2: HTTPMethod, type p3: T.Type, completion p4: @escaping (Result<T, Error>) -> Void) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}




// MARK: - Mocks generated from file: 'AniView/Features/Splash/Presentation/ViewModel/SplashViewModelProtocol.swift'

import Cuckoo
import Foundation
@testable import AniView

class MockSplashViewModelProtocol: SplashViewModelProtocol, Cuckoo.ProtocolMock, @unchecked Sendable {
    typealias MocksType = SplashViewModelProtocol
    typealias Stubbing = __StubbingProxy_SplashViewModelProtocol
    typealias Verification = __VerificationProxy_SplashViewModelProtocol

    // Original typealiases

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    private var __defaultImplStub: (any SplashViewModelProtocol)?

    func enableDefaultImplementation(_ stub: any SplashViewModelProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }


    struct __StubbingProxy_SplashViewModelProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
    }

    struct __VerificationProxy_SplashViewModelProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    }
}

class SplashViewModelProtocolStub:SplashViewModelProtocol, @unchecked Sendable {


}


