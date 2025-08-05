### About the project

AniView is a demo application that digests an API and displays it in an easy to use interface. It allows the user to search for specific dog breeds by name, 
request a random breed, or simply selecting from a list of all breeds available. The app is specifically designed and built for iOS and targets version 18.5.

## Built using

- This project uses Swift as its language along with UIKit for the user interface and Snapkit as the DSL to make constraining the UI easier. 

- The application programming interface it uses is [TheDogAPI](https://thedogapi.com/). This API is a comprehensive database of all things dogs, including images,
facts and so much more. I've chosen this API to use because basic use is free and relies on an API key to access it. 

- For persistence, I've chosen [RealmSwift](https://github.com/realm/realm-swift). This is an industry standard library maintained by MongoDB. "Realm is a mobile database
  that runs directly inside phones, tablets or wearables" and "Intuitive to Developers: Realm’s object-oriented data model is simple to learn, doesn’t need an ORM,
  and lets you write less code".

- For testing, I'm using the standard XCTest as the main test library and [Cuckoo](https://github.com/Brightify/Cuckoo) as the mocking library to make testing easier and
  more controllable.

- For dependency management, I'm using [Cocoapods](https://cocoapods.org/).

## Getting Started

This area will explain how to get the project running on their Mac. This should be a clear, step by step process to getting the app to run.

## Design idea

This should ideally be screenshots of what the intended UI design should be and how it will look.


## What could be better

This section should include any bugs or issues that might be present in the app currently. How I would improve the app and so on.
