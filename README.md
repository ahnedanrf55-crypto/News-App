
----------

# 📰 News App

**News App** is a Flutter-based mobile application that displays the latest news fetched from an API. It provides a simple and fast user experience with Skeleton Loading, smooth navigation, and a detailed news viewer.

----------

## 📱 Features

-   🔄 Fetching news from an API
    
-   📡 Displaying a loading skeleton while data is being fetched
    
-   🖼 Showing images and titles for each news item
    
-   📄 A full details page for every article
    
-   🚀 Using Cubit (Bloc) for state management
    
-   🧱 Efficient image loading with CachedNetworkImage
    
-   📂 Clean and organized folder structure
    

----------

## 🧱 Folder Structure

`lib/
│
├── core/
│   └── cubit/
│       ├── home_cubit.dart
│       └── home_state.dart
│
├── feature/
│   └── home/
│       └── widget/
│           ├── image_item_widget.dart
│           └── app_dialog_widget.dart
│
├── feature/view/
│   └── screens/
│       ├── home_screen.dart
│       └── details_screen.dart
│
├── model/
│   └── api_response_model.dart
│
├── view/widgets/
│   ├── api_response.dart
│   └── api_result.dart
│
└── main.dart` 

----------

## 🛠 Tech Stack

-   **Flutter**
    
-   **Dart**
    
-   **Bloc (Cubit)**
    
-   **Skeletonizer**
    
-   **CachedNetworkImage**
    
-   **Material Widgets**
    

----------

## 🚀 How it Works

### 🔹 1 — Fetching Data

When the home screen opens, the following function is triggered:

`homeCubit.getHomeData();` 

### 🔹 2 — Cubit States

-   **LoadingState:** Shows skeleton loaders
    
-   **SuccessState:** Displays the news items
    
-   **ErrorState:** Shows an error message
    

### 🔹 3 — Displaying the List

News items are displayed using `ListView.builder`:

`ImageItemWidget(
  image: article.urlToImage ?? dummyImage,
  title: article.title ?? "",
)` 

### 🔹 4 — Details Page

The details page includes:

-   Article image
    
-   Title
    
-   Content
    

----------

## 📦 Packages Used

`cached_network_image:  ^3.3.1  flutter_bloc:  ^8.1.3  skeletonizer:  ^2.1.1` 

----------

## ▶️ Getting Started

### 1️⃣ Install Packages

`flutter pub get` 

----------

## 📸 Screenshots 

![alt text](Screenshot_1764606295.png)

![alt text](Screenshot_1764606304.png)
----------
## 📸 Video



Uploading WhatsApp Video 2025-12-01 at 18.44.52_1b74792c.mp4…




----------

## 👨‍💻 Developer

**Ahmed Amr Abdullah**

GitHub: github.com/ahnedanrf55-crypto  
LinkedIn: linkedin.com/in/ahmed-amr-f55
