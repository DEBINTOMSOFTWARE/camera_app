Camera App

Project Description
The Camera App is a Flutter application that allows users to view, capture, and manage photos. The app has three main screens:
Photo Grid: Displays a grid view of all the photos saved in the local database.
Take Photo: Provides a camera preview with a grid overlay, allowing users to capture new photos.
Display Picture: Shows the captured photo in black and white and allows users to add a title before saving it to the local database.

Features
Display photos in a grid view, fetched from the local database.
Capture new photos using the device's camera.
View the captured photo in black and white.
Add a title to the captured photo before saving it to the local database.
Implemented using clean code practices.
Uses Riverpod as the state management library.
Utilizes SQLite for local data storage.
Leverages the camera library for capturing photos.
Incorporates Google Fonts for a visually appealing UI.
Includes widget tests for the app's widgets and screens.

Assumptions
The photos are fetched from the local database, and the app does not require an internet connection for the initial fetch.

Usage
Viewing Photos: 
Upon launching the app, users will be presented with a grid view of all the photos saved in the local database. They can scroll through the grid to view the photos and their basic information.

Capturing a New Photo:
To capture a new photo, users can tap the "Add Photo" button in the app bar.
This will navigate them to the "Take Photo" screen, where they can see the camera preview with a grid overlay.
Users can then tap the floating button to capture the photo.

Displaying the Captured Photo:
After capturing the photo, the app will navigate to the "Display Picture" screen.
Here, users can see the captured photo in black and white.
Users can also add a title for the photo and save it to the local database by tapping the "Add Photo" button.

Navigating Back:
From the "Take Photo" screen, users can navigate back to the "Photo Grid" screen.
From the "Display Picture" screen, users can navigate back to the "Take Photo" screen to capture a new photo.

Known Issues
The SQLite database insertion and fetching unit tests fail.
The app has not been tested on an iPhone or iOS simulator due to a lack of Mac availability.

Future Improvements
Cloud Storage Integration: Integrate the app with a cloud storage service (e.g., Firebase) to allow users to save and fetch photos from the cloud.
Authentication and Authorization: Implement user authentication and authorization features to provide a more secure and personalized experience.
Delete Option: Add a feature to allow users to delete photos from the local database.
