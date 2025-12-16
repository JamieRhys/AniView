import ProjectDescription

let project = Project(
    name: "Core",
    targets: [
        .target(
            name: "Core",
            destinations: .iOS,
            product: .framework,
            bundleId: "uk.co.jaffakree.AniView.Core",
            infoPlist: .default,
            sources: ["Sources/**"],
        )
    ]
)
