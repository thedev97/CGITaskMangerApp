# cgi_task_v1

CGI TaskManager App

## Getting Started

This project is a starting point for a Flutter application.

Requirements:
## App Structure:
o Features:
- Add a new task
- Mark a task as completed
- Delete a task
- Filter tasks by all, completed, and pending
o Architecture:
- Use clean architecture principles to structure the code.
- Separate the app into distinct layers: Presentation, Domain, and Data. 
o State Management:
- Use BLoC (Business Logic Component) for state management.
- Each feature (e.g., adding a task, marking a task as completed) should have its own BLoC.
o Testing:
- Write unit tests for the business logic.
- Write widget tests for the UI components.
- Ensure that the tests cover the core functionalities of the app.

## Package Used
o flutter_bloc: ^3.1.2 -> Manage the application state
o equatable: ^2.0.5 -> Compare objects
o uuid: ^4.4.2  -> Generate unique id
o go_router: ^14.2.1 -> Handle the navigation features
o google_fonts: ^6.2.1 -> Manage the fonts across the app (used Raleway fonts)
o nested: ^1.1.0 -> Deeply nested widget trees

## Clean Architecture
lib/
├── data/
│   ├── models/
│   │   └── task_model.dart
│   ├── repositories/
│       └── task_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── task.dart
│   ├── repositories/
│   │   └── task_repository.dart
│   ├── use_cases/
│       ├── add_task.dart
│       ├── delete_task.dart
│       ├── get_tasks.dart
│       ├── mark_task_complete.dart
│       └── filter_tasks.dart
├── presentation/
│   ├── blocs/
│   │   ├── task_bloc.dart
│   │   ├── task_event.dart
│   │   └── task_state.dart
│   ├── pages/
│   │   ├── home_page.dart
│   │   ├── add_task_page.dart
│   │   └── task_detail_page.dart
│   ├── widgets/
│       ├── task_list.dart
│       ├── task_item.dart
│       └── task_filter.dart
├── routes/
│   ├── screens/
│   │   └── not_found_page.dart
│   ├── app_route.dart
│   └── app_routes_const.dart
│
├── shared/
│   ├── widgets/
│   │   ├── app_bar/
│   │   │   ├── app_bar_builder.dart
│   │   │   └── ct_app_bar.dart
│   │   └── button/
│   │       ├── base_button.dart
│   │       ├── ct_elevated_button.dart
│   │       ├── ct_icon_button.dart
│   │       └── ct_segmented_button.dart
│   ├── utils/
│   │   └── font_styles.dart
│   ├── image_constants.dart
│   ├── common.dart
│   ├── ct_image_view.dart
│   └── text_field.dart
│
├── splash/
│   ├── widgets/
│   │   ├── ct_logo.dart
│   │   └── get_started_button.dart
│   └── splash.dart
├── main.dart

## Follow Linter Rules
o Rules:
  avoid_print: Avoid print calls in production code.
  prefer_single_quotes: Only use double quotes for strings containing single quotes.
  camel_case_types: Name types using UpperCamelCase.
  camel_case_extensions: Name extensions using UpperCamelCase.
  annotate_overrides: Annotate overridden members.
  overridden_fields: Don't override fields.
  unnecessary_overrides: Don't override a method to do a super method invocation with the same parameters.
  avoid_implementing_value_types: Don't implement classes that override ==.
  always_specify_types: Specify type annotations.
  avoid_init_to_null: Don't explicitly initialize variables to null.
  prefer_const_constructors : Prefer const with constant constructors.
  sort_constructors_first: Sort constructor declarations before other members.
  type_annotate_public_apis: Type annotate public APIs.
  always_declare_return_types: Declare method return types.
  await_only_futures: Await only futures.
  file_names: Name source files using lowercase_with_underscores.