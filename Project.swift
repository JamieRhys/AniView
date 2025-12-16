import ProjectDescription

let project = Project(
    name: "AniView",
    targets: [
        .target(
            name: "AniView",
            destinations: .iOS,
            product: .app,
            bundleId: "uk.co.jaffakree.AniView",
            infoPlist: .extendingDefault(with: [
                "UIApplicationSceneManifest": [
                    "UIApplicationSupportsMultipleScenes": false,
                    "UISceneConfigurations": [
                        "UIWindowSceneSessionRoleApplication": [
                            [
                                "UISceneConfigurationName": "Default Configuration",
                                "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                            ]
                        ]
                    ]
                ],
                "UILaunchStoryboardName": "LaunchScreen",
            ]),
            buildableFolders: [
                "AniView/Sources",
                "AniView/Resources",
            ],
            dependencies: [
                .project(target: "Core", path: "Projects/Core"),
                .project(target: "DesignSystem", path: "Projects/DesignSystem"),
                .project(target: "Splash", path: "Projects/Features/Splash"),
                
                .external(name: "RxSwift"),
                .external(name: "RxCocoa"),
                .external(name: "SnapKit"),
            ]
        ),
        .target(
            name: "AniViewTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "uk.co.jaffakree.AniViewTests",
            infoPlist: .default,
            buildableFolders: [
                "AniView/Tests"
            ],
            dependencies: [.target(name: "AniView")]
        ),
    ]
)
