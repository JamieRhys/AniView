import ProjectDescription

let project = Project(
    name: "Splash",
    targets: [
        .target(
            name: "Splash",
            destinations: .iOS,
            product: .framework,
            bundleId: "uk.co.jaffakree.AniView.Splash",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "RxSwift"),
                .external(name: "RxCocoa"),
                .external(name: "SnapKit"),
            ],
        ),
        .target(
            name: "SplashTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "uk.co.jaffakree.AniView.SplashTests",
            infoPlist: .default,
            sources: ["Tests/Sources/**"],
            dependencies: [
                .target(name: "Splash"),
                .external(name: "Cuckoo"),
                .external(name: "RxTest"),
                .external(name: "RxBlocking"),
                ProjectDescription.TargetDependency.xctest
            ],
        ),
//        .target(
//            name: "SplashUITests",
//            destinations: .iOS,
//            product: .uiTests,
//            bundleId: "uk.co.jaffakree.AniView.SplashUITests",
//            infoPlist: .default,
//            sources: ["UITests/Sources/**"],
//            dependencies: [
//                .target(name: "Splash"),
//                .project(target: "AniView", path: "../../../"),
//            ],
//        )
    ]
)
