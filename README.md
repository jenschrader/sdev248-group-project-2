# 🎯🤠 Little Sure Shot

A Godot 4.4 game inspired by Annie Oakley, created as a group project for our game development class. 

***Play as Annie as she searches for her missing gun and defends the town from invading bandits!***

---

## ⚙️ Project Setup

### 🛠 Requirements
- **Godot Engine 4.4**
- **Git** installed on your machine

---

### 🔄 How to Clone & Open the Project

1. **Clone the repository** (use HTTPS):
   
   ```bash
   git clone https://github.com/jenschrader/sdev248-group-project-2.git
   cd sdev248-group-project-2
   ```
2. **Switch to the develop branch**:
   ```bash
   git checkout develop
   ```

3. **Open Godot**, click **"Import"**, and select the `project.godot` file inside the folder you just cloned.

---

## 📄 Project Structure
```
res://
├── assets/
│   ├── fonts/          # UI and cutscene fonts
│   ├── sprites/        # Player, NPC, enemies, etc.
│   └── tilesets/       # Map tilesets
│
├── scenes/
│   ├── ui/             # Start screen, cutscene, level complete
│   ├── levels/         # Intro saloon and town levels
│   ├── characters/     # Player, NPC, enemies
│   └── objects/        # Interactables, items, etc.
│
├── scripts/
│   ├── player/         # Player movement, shooting
│   ├── enemies/        # Bandit behavior
│   ├── systems/        # Game management, state logic
│   └── ui/             # UI scene scripts
│
├── main.tscn           # Entry point (starts at StartScreen)
├── project.godot       # Godot project config
└── .gitignore
```
---
## 📌 Team Guidelines
- ⬆️ Only push to the `develop` branch.
   -  `main` is protected — changes go through pull requests.
- 📂 Keep things organized — add your scenes/scripts in the appropriate folders.
- 📲 Communicate before adding large features — this helps avoid merge conflicts and confusion.

---

## 🎬 Game Flow (WIP)
1. **StartScreen** &rarr; Button to begin
2. **Cutscene** &rarr; Text scroll to set up story
3. **IntroSaloon** &rarr; Talk to NPC, find weapon, trigger swinging door
4. **TownLevel** &rarr; Fight bandits, win or lose
5. **LevelComplete** &rarr; Level completion screen, return to start for replay

---

## ✅ Project Goals
This project will demonstrate:
- 🎮 Player movement and interaction
- 🗨️ NPC dialogue
- ☠️ Enemy AI with non-random behavior
- 🗺️ `NavigationMesh` based movement
- 🚪 A hinge joint mechanic (saloon door)
- 🎥 Cutscenes (intro + end)
- ⚡ Event triggers based on player actions
- 💥 Proper collision behavior
