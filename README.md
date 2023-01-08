# news_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## News App

## Create a News discovery App with 2 features for users:
    Users can search for a news based on a keyword
    Users can see the breaking news as and when they open the app
    You’ll be using an open web service called News API (https://newsapi.org) for fetching all the data.
    API requires registering for an API key to become able to get responses from the api requests.



## Refer to https://newsapi.org/docs/get-started for the structures of requests and responses of api calls.

## UI requirements:

    Create a Home Screen with a bottom navigation, enabling the user to switch between ‘Breaking News’ screen and ‘Search News’ screen.
    By Default, User sees the Breaking News screen when he/she opens the app.
    Both screens involve lists to be shown on either page.
    Functionality requirements:

    The search api call is triggered every time a user changes the text in the search field and is delayed by 0.3 to 0.5 seconds 
    every time so that user gets enough time to write his search query. (The subsequent api call for search is delayed every time the text changes.

## Architecture requirements:

    Write the best clean code you can write. (Important for evaluation)
    Use any state management to achieve the above features (recommended flutter bloc).

## demo APK

[Click here](https://github.com/patildarshan66/news-app/blob/master/news-app.apk) for download demo app.


