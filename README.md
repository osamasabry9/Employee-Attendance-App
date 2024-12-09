# Employee-Attendance-App


## **Overview**  
The Leave Management App is designed to streamline the process of managing and tracking leave requests for employees. It ensures a smooth user experience by following Clean Architecture principles, maintaining reusability, and providing a responsive UI aligned with modern design standards.  

---

## **General Guidelines**  
- **UI Development**:  
  - The app UI is developed based on provided designs, adhering to the colors, fonts, and theme used in the existing project.  
  - Repetitive elements are extracted into reusable widgets/components to ensure modularity.  

- **Code Quality**:  
  - Clean, readable, and well-documented code is written to ensure maintainability.  
  - The project strictly follows **Clean Architecture principles** to separate business logic, UI, and data layers.  

---

The main packages used in the project:

```yaml

dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_bloc: ^8.1.3
  get_it: ^7.6.4
  dartz: ^0.10.1
  equatable: ^2.0.5
  freezed_annotation: ^2.4.1
  uuid: ^4.2.1

  # UI
  flutter_screenutil: ^5.9.0
  iconsax: ^0.0.8

  # Navigation
  go_router: ^12.1.1

  # Storage
  shared_preferences: ^2.2.2
  sqflite: ^2.3.0

  # Utils
  intl: ^0.18.1
  logger: ^2.0.2+1
  flutter_native_splash: ^2.4.3
  firebase_core: ^3.8.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  build_runner: ^2.4.6
  freezed: ^2.4.5
  json_serializable: ^6.7.1
  flutter_launcher_icons: ^0.14.2
```

## **Screens**  

### **1. All Leaves (Main Screen)**  
- **Features**:  
  - Display cards for:  
    - **Leave Balance**  
    - **Approved Leaves**  
    - **Pending Requests**  
    - **Cancelled Requests**  
  - **Counters** are included inside cards and styled to match the project theme.  
  - A **tab bar** allows navigation between:  
    - Upcoming Leaves  
    - Past Leaves  
    - Team Leave Requests  
  - A **list view** for leave requests shows:  
    - Status (Approved/Rejected)  
    - Days applied  
    - Balance  
    - Approver name  

---

### **2. Team Leave**  
- **Features**:  
  - Display a list of team leave requests.  
  - Include **Reject** and **Accept** buttons for each request.  
  - Add **profile avatars** beside team member names for a more interactive experience.  

---

### **3. Apply Leave**  
- **Features**:  
  - A form for applying for leave with the following fields:  
    - **Title**  
    - **Leave Type** (dropdown)  
    - **Contact Number**  
    - **Start Date** (date picker)  
    - **End Date** (date picker)  
    - **Reason**  
  - A **prominent Apply Leave button** to submit the request.  

---

## **Technical Implementation**  

### **State Management**  
- The app uses a **state management solution** (Bloc, cubit) to handle dynamic data updates in the UI seamlessly.  

---

### **Folder Structure**  
The project codebase is organized for scalability and maintainability:  
- **screens/**: Contains all screen-related files.  
- **widgets/**: Houses reusable UI components.  
- **models/**: Includes data models used throughout the app.  
- **providers/**: Handles state management and business logic.  

---

### **Reusable Widgets**  
- Created reusable widgets for:  
  - Cards (e.g., leave status cards).  
  - Status buttons (e.g., Approve, Reject).  

---

## **Expected Output**  

1. **Clean and Maintainable Code**  
   - Written with modern best practices.  
   - Follows Clean Architecture principles.  

2. **Responsive UI**  
   - Designed to adapt seamlessly to different screen sizes.  
   - Matches the project’s theme and design specifications.  

3. **Scalable Architecture**  
   - The architecture allows future enhancements and feature additions without breaking the existing code.  

---

## **How to Run the Project**  
## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/osamasabry9/Employee-Attendance-App.git
```

**Step 2:**

Go to the project root and execute the following command in the console to get the required dependencies:

```
flutter pub get
flutter run
```

