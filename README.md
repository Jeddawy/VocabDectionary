# VocabDectionary

VocabDectionary is an iOS application built with SwiftUI  that provides a sleek, modern interface for exploring word definitions. 

## Features

- **Translate any word and cach it.

## Architecture

The app follows and implements the MVVM (Model-View-ViewModel) architecture pattern:

# TranslationRepository:
  The core layer responsible for orchestrating data retrieval and storage.
  Implements the MVVM pattern for data management.
  Interacts with the LocalDataSource for fetching data from a local source using [Realm]
  Interacts with the RemoteDataSource for fetching data from a remote source.
# RemoteDataSource:
 Handles communication with the external data source.
  Uses an HttpClient to make network requests.
  Can be easily replaced or extended to accommodate different data sources (e.g., GraphQL).
# HttpClient: 
 Provides a generic interface for making HTTP requests.
 Can be implemented using various libraries (e.g., URLSession, Alamofire).


## Implementation

- **SwiftUI**: For building a responsive and declarative UI.
- **Third-Party Frameworks**: Realm for caching.

## Error Handling

The app includes comprehensive error-handling mechanisms to manage network errors, API failures, and unexpected exceptions, ensuring a smooth user experience.

## Testing

Unit tests are provided to cover critical components and functionalities, including domain logic, data retrieval.

## Getting Started

1. Clone this repository to your local machine.
2. Open Terminal
3- Change directory to folder path
4- Install cocoapods
5- Build and run the app on a simulator or physical device.


### Video Demonstration
![Simulator Screenshot - Clone 1 of iPhone 15 Pro - 2024-08-13 at 22 33 04](https://github.com/user-attachments/assets/418b3666-e2b7-4547-9836-d192545eef7a)
![Simulator Screenshot - Clone 1 of iPhone 15 Pro - 2024-08-13 at 22 33 07](https://github.com/user-attachments/assets/8f0b1793-fdd8-4818-815e-a679d11b1156)


https://github.com/user-attachments/assets/819cb3b2-7e37-4745-82f7-86c58379d82b

