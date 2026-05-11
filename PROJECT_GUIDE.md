# Project guide — how the app works & what each file does

This document describes the **Quiz** Flutter app (`pubspec.yaml` name: `quiz`). All Dart imports use the prefix **`package:quiz/...`**.

---

## 1. How the project works (big picture)

1. **`main.dart`** calls `runApp` with **`QuizMaterialApplication`**.
2. **`QuizMaterialApplication`** builds **`GetMaterialApp`** (from **GetX**) with theme colors from **`AppColors`** and sets **`home`** to **`AuthLoginScreen`** (login first).
3. **Auth**
   - **Login**: `AuthLoginScreen` holds text controllers and password visibility; the visible layout is **`AuthLoginScreenFormLayout`**. Tapping **LOGIN** calls **`registerKanbanBoardTasksListController()`** (creates a fresh GetX controller for tasks), then **`Get.off`** navigates to **`KanbanBoardScreen`** (replaces the route so the user cannot “back” to login with the system back button).
   - **Sign up**: opened with **`Navigator.push`** from **`AuthNavigateToSignUpButton`**. `AuthSignUpScreen` initializes **Google Sign-In** and shows **`AuthSignUpScreenFormLayout`**. Submit runs form validation and shows a **SnackBar** (demo only; no backend).
4. **Kanban**
   - **`KanbanBoardTasksListController`** (GetX) keeps an observable list of **`KanbanBoardTaskNode`** (tree: each node can have `children`).
   - UI widgets use **`Get.find<KanbanBoardTasksListController>()`** and **`Obx`** so the list redraws when tasks change.
   - Dialogs for new/edit title and delete confirmation live in **`kanban_board_prompt_modals.dart`** and **`kanban_board_task_title_input_dialog.dart`**.
   - Pure tree search/delete is in **`kanban_board_task_forest_helpers.dart`** (no GetX, no UI).

**State management:** **GetX** (`Get.put` / `Get.find` / `Get.delete`, `.obs`, `Obx`, `Get.dialog`, `Get.off`).

---

## 2. External packages (what the app depends on)

| Package | Used for |
|--------|-----------|
| **`flutter`** (SDK) | UI (`Material`, `Scaffold`, `Navigator`, …). |
| **`get`** | `GetMaterialApp`, routing, dialogs, reactive lists (`RxList`, `Obx`). |
| **`google_sign_in`** | `GoogleSignIn.instance` on sign-up screen. |
| **`google_sign_in_web`** | Web plugin cast for rendering the Google button. |
| **`google_sign_in_platform_interface`** | `GoogleSignInPlatform.instance` (typed dependency for lints). |

---

## 3. Folder layout (why it exists)

| Folder | Role |
|--------|------|
| **`lib/app/`** | Root app widget (`GetMaterialApp`). |
| **`lib/auth/`** | Everything for login & sign-up: **screens** (state), **layouts** (UI tree), **widgets** (small reusable pieces). |
| **`lib/kanban/`** | Kanban feature: **screens**, **layouts**, **state** (controller + helpers + modals + ids), **models**, **widgets**. |
| **`lib/theme/`** | Shared colors (`AppColors`). |

---

## 4. File-by-file reference

Below: **file** → **what it does** → **main imports / APIs used**.

### Entry & app shell

| File | Purpose | Uses |
|------|---------|------|
| **`lib/main.dart`** | App entry: `main()` → `runApp`. | `flutter/material.dart`, `quiz/app/quiz_material_application.dart`. |
| **`lib/app/quiz_material_application.dart`** | Root `StatelessWidget`: `GetMaterialApp`, theme seed, `home: AuthLoginScreen`. | `flutter/material.dart`, `get/get.dart`, `quiz/auth/screens/auth_login_screen.dart`, `quiz/theme/app_colors.dart`. |

### Theme

| File | Purpose | Uses |
|------|---------|------|
| **`lib/theme/app_colors.dart`** | Central color constants for auth + Kanban gradients, brand blue, danger red, etc. | `flutter/material.dart` only. |

### Auth — screens (Stateful: owns controllers & `dispose`)

| File | Purpose | Uses |
|------|---------|------|
| **`lib/auth/screens/auth_login_screen.dart`** | Login screen: email/password `TextEditingController`s, obscure flag, `dispose`. | `flutter/material.dart`, `quiz/auth/layouts/auth_login_screen_form_layout.dart`. |
| **`lib/auth/screens/auth_sign_up_screen.dart`** | Sign-up screen: `GoogleSignIn.initialize`, form key, controllers, submit → `SnackBar`. | `flutter/material.dart`, `google_sign_in/google_sign_in.dart`, `quiz/auth/layouts/auth_sign_up_screen_form_layout.dart`. |

### Auth — layouts (Stateless: only layout + callbacks)

| File | Purpose | Uses |
|------|---------|------|
| **`lib/auth/layouts/auth_login_screen_form_layout.dart`** | Login UI: gradient shell, fields, LOGIN button (`registerKanbanBoardTasksListController` + `Get.off` → `KanbanBoardScreen`), link to sign-up. | `flutter/material.dart`, `get/get.dart`, auth widgets, `quiz/kanban/screens/kanban_board_screen.dart`, `quiz/theme/app_colors.dart`. |
| **`lib/auth/layouts/auth_sign_up_screen_form_layout.dart`** | Sign-up UI: gradient shell, `Form`, fields, SIGN UP, Google button, link to login. | `flutter/material.dart`, auth widgets, `quiz/theme/app_colors.dart`. |

### Auth — widgets (small reusable UI)

| File | Purpose | Uses |
|------|---------|------|
| **`lib/auth/widgets/auth_branded_gradient_scroll_shell.dart`** | Shared purple–teal gradient + `SafeArea` + centered `SingleChildScrollView` for auth pages. | `flutter/material.dart`, `quiz/theme/app_colors.dart`. |
| **`lib/auth/widgets/auth_email_text_field.dart`** | Email `TextFormField` + gmail/hotmail regex validator. | `flutter/material.dart`, `quiz/theme/app_colors.dart`. |
| **`lib/auth/widgets/auth_password_text_field.dart`** | Password field + length validator + visibility toggle. | `flutter/material.dart`, `quiz/theme/app_colors.dart`. |
| **`lib/auth/widgets/auth_password_confirm_text_field.dart`** | Confirm password; must match primary password (trimmed). | `flutter/material.dart`, `quiz/theme/app_colors.dart`. |
| **`lib/auth/widgets/auth_google_identity_button.dart`** | Renders official Google sign-in control on web (`GoogleSignInPlugin.renderButton`). | `flutter/material.dart`, `google_sign_in_platform_interface`, `google_sign_in_web`. |
| **`lib/auth/widgets/auth_route_navigation_buttons.dart`** | `Navigator.push` text buttons: to sign-up / to login (`AuthNavigateToSignUpButton`, `AuthNavigateToLoginButton`). | `flutter/material.dart`, `quiz/auth/screens/auth_login_screen.dart`, `quiz/auth/screens/auth_sign_up_screen.dart`. |

### Kanban — screen entry

| File | Purpose | Uses |
|------|---------|------|
| **`lib/kanban/screens/kanban_board_screen.dart`** | Stateless shell around board layout; exports **`registerKanbanBoardTasksListController()`** (deletes old controller if any, `Get.put` new one). | `flutter/material.dart`, `get/get.dart`, `quiz/kanban/layouts/kanban_board_screen_shell_layout.dart`, `quiz/kanban/state/kanban_board_tasks_list_controller.dart`. |

### Kanban — layout

| File | Purpose | Uses |
|------|---------|------|
| **`lib/kanban/layouts/kanban_board_screen_shell_layout.dart`** | `Scaffold` + app bar + gradient body + toolbar + scrollable task area (`GetView` bound to `KanbanBoardTasksListController`). | `flutter/material.dart`, `get/get.dart`, Kanban state + widget imports. |

### Kanban — model

| File | Purpose | Uses |
|------|---------|------|
| **`lib/kanban/models/kanban_board_task_node.dart`** | Data class: `id`, `title`, `children` list (recursive tree). | No imports (pure Dart). |

### Kanban — state (logic, not full-screen layout)

| File | Purpose | Uses |
|------|---------|------|
| **`lib/kanban/state/kanban_board_tasks_list_controller.dart`** | GetX controller: `RxList` of tasks, add/update/delete, prompts via modals. | `get/get.dart`, Kanban model + `kanban_board_prompt_modals`, `kanban_board_task_forest_helpers`, `kanban_board_task_id_generator`. |
| **`lib/kanban/state/kanban_board_task_forest_helpers.dart`** | `findKanbanBoardTaskById`, `removeKanbanBoardTaskById` (recursive on lists). | `quiz/kanban/models/kanban_board_task_node.dart`. |
| **`lib/kanban/state/kanban_board_task_id_generator.dart`** | `generateKanbanBoardTaskNodeId()` using time + random. | `dart:math`. |
| **`lib/kanban/state/kanban_board_prompt_modals.dart`** | `Get.dialog` wrappers: task title prompt, delete confirmation. | `flutter/material.dart`, `get/get.dart`, `quiz/kanban/widgets/kanban_board_task_title_input_dialog.dart`, `quiz/theme/app_colors.dart`. |

### Kanban — widgets (UI pieces)

| File | Purpose | Uses |
|------|---------|------|
| **`lib/kanban/widgets/kanban_board_gradient_backdrop.dart`** | Full-screen gradient behind board content. | `flutter/material.dart`, `quiz/theme/app_colors.dart`. |
| **`lib/kanban/widgets/kanban_board_title_app_bar.dart`** | `AppBar` titled “Kanban”, brand blue. | `flutter/material.dart`, `quiz/theme/app_colors.dart`. |
| **`lib/kanban/widgets/kanban_board_add_task_toolbar.dart`** | “ADD TASK” button → `promptAddRootTask` on controller. | `flutter/material.dart`, `get/get.dart`, controller + `AppColors`. |
| **`lib/kanban/widgets/kanban_board_tasks_scroll_view.dart`** | `SingleChildScrollView` wrapping the observable tasks panel. | `flutter/material.dart`, `kanban_board_tasks_observable_list_panel.dart`. |
| **`lib/kanban/widgets/kanban_board_tasks_table_header_strip.dart`** | White header strip + `Table` row with column titles (`KanbanBoardTasksColumnHeaderLabel`). | `flutter/material.dart`, `quiz/theme/app_colors.dart`. |
| **`lib/kanban/widgets/kanban_board_tasks_empty_hint_panel.dart`** | Message when there are no tasks. | `flutter/material.dart`. |
| **`lib/kanban/widgets/kanban_board_tasks_observable_list_panel.dart`** | **`Obx`** on `tasks`: header + empty state or list of **`KanbanBoardRootTaskCard`**. | `flutter/material.dart`, `get/get.dart`, controller + sibling widget imports. |
| **`lib/kanban/widgets/kanban_board_root_task_card.dart`** | Card for one root task + optional “Sub-tasks” section + **`KanbanBoardNestedTaskTreeList`**. | `flutter/material.dart`, model, nested list + overflow menu, `AppColors`. |
| **`lib/kanban/widgets/kanban_board_nested_task_tree_list.dart`** | For each node: child row + recurse for nested children. | `flutter/material.dart`, model, `kanban_board_child_task_row.dart`. |
| **`lib/kanban/widgets/kanban_board_child_task_row.dart`** | Indented row for a nested task + overflow menu. | `dart:math`, `flutter/material.dart`, model, overflow menu, `AppColors`. |
| **`lib/kanban/widgets/kanban_board_task_overflow_actions_menu.dart`** | `PopupMenuButton` wired to add child / edit / delete on controller. | `flutter/material.dart`, `get/get.dart`, model, controller, `AppColors`. |
| **`lib/kanban/widgets/kanban_board_task_title_input_dialog.dart`** | `AlertDialog` with `TextField`; owns `TextEditingController` for safe dispose. | `flutter/material.dart`, `get/get.dart`, `AppColors`. |

---

## 5. Navigation cheat sheet

| Action | Mechanism |
|--------|-----------|
| Login → Kanban | **`Get.off(() => KanbanBoardScreen())`** after **`registerKanbanBoardTasksListController()`**. |
| Login ↔ Sign up | **`Navigator.push`** + **`MaterialPageRoute`** (`AuthRouteNavigationTextButton`). |
| Task title / delete | **`Get.dialog`** via **`KanbanBoardPromptModals`** and **`KanbanBoardTaskTitleInputDialog`**. |

---

## 6. Keeping this guide accurate

When you add or rename files, update this **`PROJECT_GUIDE.md`** in the same commit so newcomers (and future you) stay oriented.

If you rename the Dart package in `pubspec.yaml` (`name: quiz`), you must change **every** `package:quiz/` import across the app to match.
