# articles_app

## Description

The app shows a list of articles of the NY Times Most Popular Articles, and shows details when items on the list are tapped.

## Packages used

- [flutter_riverpod](https://pub.dev/packages/riverpod) for state management.
- [dio](https://pub.dev/packages/dio) for network requests.
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) for obscure API keys.
- [get_it](https://pub.dev/packages/get_it) for Dependency Injections.
- [url_launcher](https://pub.dev/packages/url_launcher) for launching a URL.

## Features

### 1) Get articles by period ( 1, 7, 30 days )

<img src="https://github.com/hadeel-harbi/ArticlesApp/assets/132256369/a4aadd2e-a789-41aa-9346-dcdddb138112" width=20% height=20%>

### 2) Search functionality

<img src="https://github.com/hadeel-harbi/ArticlesApp/assets/132256369/d21ee2ad-7e99-4ce7-8e39-9a584fe2d949" width=20% height=20%>

### 3) List or Grid display mode

<img src="https://github.com/hadeel-harbi/ArticlesApp/assets/132256369/9386cd1c-a512-4756-a964-fc712e7324d8" width=20% height=20%>

### 4) Pull to refresh

<img src="https://github.com/hadeel-harbi/ArticlesApp/assets/132256369/d10d5909-a453-4984-8961-c74538ef0616" width=20% height=20%>

<br>

## Unit Test

To run all tests, run this command in the terminal from the root of the project:

```
flutter test test/api_test.dart
```

<br>

## Handling API key

Before running the app, Create a `.env` file at the root of the project and add the key:

```
// .env
API_KEY=api-key-here
```

## Running the code

To run the app, run this command in the terminal from the root of the project:

```
flutter pub get
flutter run
```
