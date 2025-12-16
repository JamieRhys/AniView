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
            sources: [
                "AniView/Sources/**",
            ],
            resources: [
                "AniView/Resources/**",
            ],
            dependencies: [
                .project(target: "Core", path: "Projects/Core"),
                .project(target: "DesignSystem", path: "Projects/DesignSystem"),
                .project(target: "Splash", path: "Projects/Features/Splash"),
            ]
        ),
        .target(
            name: "AniViewTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "uk.co.jaffakree.AniViewTests",
            infoPlist: .default,
            sources: [
                "AniView/Tests/**"
            ],
            dependencies: [.target(name: "AniView")]
        ),
        .target(
            name: "AniViewUITests",
            destinations: .iOS,
            product: .uiTests,
            bundleId: "uk.co.jaffakree.AniViewUITests",
            infoPlist: .default,
            sources: [
                "AniView/UITests/**"
            ],
            dependencies: [
                .target(name: "AniView")
            ]
        )
    ]
)
