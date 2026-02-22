
```markdown
# Cartify App

A professional E-commerce application built with Flutter, demonstrating Clean Architecture, advanced State Management, and a premium user experience.

---

## Technical Overview (The 6 Pillars)

1. **Project Purpose**: Cartify is designed to provide a high-performance mobile shopping interface that handles complex states like real-time cart updates and dynamic theming seamlessly.
2. **Target Audience**: Users seeking an intuitive shopping experience and developers looking for a robust implementation of the BLoC pattern in a real-world scenario.
3. **Problem Solved**: It eliminates UI lag and state inconsistency during high-interaction tasks (like rapid cart adjustments) through optimized state management.
4. **Implementation Logic**: The app utilizes a Feature-First architecture, separating business logic (Cubits) from the presentation layer, and communicates with the Escuela JS API using a centralized Dio client.
5. **Core Functionalities**: Includes categorized product browsing, multi-state favorites system, persistent cart management with quantity logic, and a full dark/light mode toggle.
6. **Technical Decision**: Built with Flutter for cross-platform efficiency, using BLoC for predictable state transitions and Dio for scalable network layers.

---

## Features

- **Advanced Cart Management**: Efficiently handles product quantities, preventing duplicate entries and calculating totals in real-time.
- **Dynamic Theming**: Support for Light and a premium "Accent-Orange" Dark Mode.
- **Persistent Storage**: Utilizes shared preferences for maintaining user settings and sessions.
- **Responsive Design**: Pixel-perfect UI across all screen sizes using ScreenUtil.
- **Category Filtering**: Integrated API filtering for specific product categories.

---

## Project Structure

```text
lib/
 ├── core/
 │    ├── constants/       # Assets, Colors, Spacing, Strings, Text Styles
 │    ├── network/         # Dio Client and API Endpoints
 │    ├── themes/          # AppTheme and ThemeCubit
 │    └── utils/           # Input Validators
 ├── features/
 │    ├── splash/          # Branding and initialization
 │    ├── onboarding/      # Smooth introduction with page indicators
 │    ├── auth/            # Authentication logic and screens
 │    ├── home/            # Product Grid, Models, and API Services
 │    ├── cart/            # Cart logic and quantity management
 │    ├── favorites/       # Wishlist and favorite state management
 │    └── profile/         # User settings and theme switching
 └── main.dart             # Global Providers and App Entry

```

---

## Tech Stack & Dependencies

The project leverages 10+ industry-standard packages to ensure performance and maintainability:

* **State Management**: `flutter_bloc` & `equatable` for predictable, testable states.
* **Networking**: `dio` for robust HTTP requests and interceptors.
* **UI & Styling**: `google_fonts`, `flutter_svg`, and `cached_network_image` for a rich visual experience.
* **Responsiveness**: `flutter_screenutil` for adaptive layouts.
* **Utilities**: `shared_preferences` for local storage and `smooth_page_indicator` for onboarding.
* **Development Tools**: `device_preview` for testing layouts across different devices.

---

## API Integration

The app consumes the **Escuela JS API**:

* **Endpoint**: `https://api.escuelajs.co/api/v1/products/`
* **Category Filtering**: Integrated using `categoryId=1` for focused product displays.

---

## Installation and Setup

1. **Clone the repository**:
```bash
git clone [https://github.com/SalahHassan202/flutter_cartify_app.git](https://github.com/SalahHassan202/flutter_cartify_app.git)

```


2. **Install dependencies**:
```bash
flutter pub get

```


3. **Generate a release APK**:
```bash
flutter build apk --release

```



---

## Author

**Salah Hassan**

* [GitHub Profile](https://github.com/SalahHassan202)
* [Project Repository](https://github.com/SalahHassan202/flutter_cartify_app.git)

```

---

## 🗺️ Roadmap & Future Enhancements
- [ ] **Firebase Backend**: Real-time user authentication and profile persistence.
- [ ] **Payment Integration**: Secure checkout using Stripe API.
- [ ] **Order History**: A new feature to track previous purchases.
- [ ] **Push Notifications**: Abandoned cart reminders and sale alerts via FCM.
- [ ] **Localization**: Support for Arabic and English languages.

```