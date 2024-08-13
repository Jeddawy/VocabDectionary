# VocabDectionary
a simple app with SWIFTUI in MVVM
## Project Overview
### Video Demonstration
![Simulator Screenshot - Clone 1 of iPhone 15 Pro - 2024-08-13 at 22 33 04](https://github.com/user-attachments/assets/418b3666-e2b7-4547-9836-d192545eef7a)
![Simulator Screenshot - Clone 1 of iPhone 15 Pro - 2024-08-13 at 22 33 07](https://github.com/user-attachments/assets/8f0b1793-fdd8-4818-815e-a679d11b1156)



https://github.com/user-attachments/assets/819cb3b2-7e37-4745-82f7-86c58379d82b



## VocabDectionary ## 
is a Swift-based MVVM project designed to efficiently manage data retrieval and persistence for translations. The project employs a robust data layer that prioritizes local data access, leveraging Realm for storage. If the required data is not found locally, it is fetched from a remote data source via an HTTP client.

### Project Structure

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


### Key Features

Efficient data access: Prioritizes local data for faster retrieval.
Flexible data source management: Easily swappable RemoteDataSource and HttpClient for adaptability.
Robust error handling: Implements appropriate error handling mechanisms for both local and remote data operations.
Clear separation of concerns: Adheres to the MVVM pattern for better maintainability.

## Usage

To use this project, clone it and provide the necessary dependencies (Realm, HttpClient implementation).

## Dependencies

Realm

