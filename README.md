Camera App

Project Description

The Camera App is a Flutter application that allows users to view, capture, and manage photos. 

The app has three main screens:
1) Photo Grid: Displays a grid view of all the photos saved in the local database.
2) Take Photo: Provides a camera preview with a grid overlay, allowing users to capture new photos.
3) Display Picture: Shows the captured photo in black and white and allows users to add a title before saving it to the local database.

Features

1) Display photos in a grid view, fetched from the local database.
2) Capturing new photos using the device's camera, with a customizable grid overlay added to the camera preview.
3) View the captured photo in black and white.
4) Add a title to the captured photo before saving it to the local database.
5) Implemented using clean code practices.
6) Uses Riverpod as the state management library.
7) Utilizes SQLite for local data storage.
8) Leverages the camera library for capturing photos.
9) Incorporates Google Fonts for a visually appealing UI.
10) Includes widget tests for the app's widgets and screens.
   
Assumptions
The photos are fetched from the local database, and the app does not require an internet connection for the initial fetch.

Usage

1) Viewing Photos: 
Upon launching the app, users will have a grid view of all the photos saved in the local database. They can scroll through the grid to view the photos and their basic information.

2) Capturing a New Photo:
Users can tap the "Add Photo" button in the app bar to capture a new photo.
This will navigate them to the "Take Photo" screen, where they can see the camera preview with a grid overlay.
Users can then tap the floating button to capture the photo.

3) Displaying the Captured Photo:
After capturing the photo, the app will navigate to the "Display Picture" screen.
Here, users can see the captured photo in black and white.
Users can also add a title for the photo and save it to the local database by tapping the "Add Photo" button.

4) Navigating Back:
From the "Take Photo" screen, users can navigate back to the "Photo Grid" screen.
From the "Display Picture" screen, users can navigate back to the "Take Photo" screen to capture a new photo.

Known Issues

The SQLite database insertion and fetching unit tests fail.
Due to a lack of Mac availability, the app has not been tested on an iPhone or iOS simulator.

Future Improvements

1) Cloud Storage Integration: Integrate the app with a cloud storage service (e.g., Firebase) to allow users to save and fetch photos from the cloud.
2) Authentication and Authorization: Implement user authentication and authorization features to provide a more secure and personalized experience.
3) Delete Option: Add a feature to allow users to delete photos from the local database.


