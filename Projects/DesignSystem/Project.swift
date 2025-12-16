import ProjectDescription

let project = Project(
    name: "DesignSystem",
    targets: [
        .target(
            name: "DesignSystem",
            destinations: .iOS,
            product: .framework,
            bundleId: "uk.co.jaffakree.AniView.DesignSystem",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"]
        )
    ]
)
