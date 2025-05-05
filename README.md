
<img width="1000" alt="lil_sure_shot" src="https://github.com/user-attachments/assets/0e2cddad-c634-4d6e-8135-f718254fbbb2" />

# 🎯🤠 Little Sure Shot

A Godot 4.4 game inspired by Annie Oakley, created as a group project for our game development class. 

***Play as Annie as she searches for her missing gun across a saloon and train yard before the big show!***

---

## ⚙️ Project Setup

### 🛠 Requirements
- **Godot Engine 4.4**
- **Git** installed on your machine

---
> [!TIP]
> ### 🔄 How to Clone & Open the Project
>
> 1. **Clone the repository** (use HTTPS):
>   
>   ```bash
>   git clone https://github.com/jenschrader/sdev248-group-project-2.git
>   cd sdev248-group-project-2
>   ```
> 2. **Switch to the develop branch**:
>   ```bash
>   git checkout develop
>   ```
>
> 3. **Open Godot**, click **"Import"**, and select the `project.godot` file inside the folder you just cloned.

---

## 📄 Project Structure
```
res://
├── assets/
│   ├── audio/           # sound effects and music
│   ├── backgrounds/     # decorative images
│   ├── fonts/           # fonts used across UI
│   ├── sprites/         # character and item sprites
│   ├── themes/          # custom ui themes
│   └── tilesets/        # tiles for level design
│
├── scenes/
│   ├── characters/      # player 
│   ├── levels/          # intro saloon, town level
│   ├── objects/         # interactables (barrels and railcars)
│   └── ui/              # cutscene, dialogue, pause menu, etc
│
├── scripts/
│   ├── objects/         # scripts for interactables
│   ├── player/          # player movement, animation, interaction
│   ├── systems/         # game manager logic
│   └── ui/              # dialogue, fader, pause logic, etc
│
├── project.godot        # godot project config (entry point: start screen)
└── .gitignore
```
---
> [!IMPORTANT]
> ## 📌 Team Guidelines
> - ⬆️ Only push to the `develop` branch.
>   -  `main` is protected — changes go through pull requests.
>   
> - 📂 Keep things organized — add your scenes/scripts in the appropriate folders.
>  
> - 📲 Communicate before adding large features — this helps avoid merge conflicts and confusion.
---

## 🎬 Game Flow 
1. **StartScreen** &rarr; press start to begin
   
2. **Cutscene** &rarr; typewriter-style story setup with optional fast-forward
   
3. **IntroSaloon** &rarr; search barrels for the missing gun; all must be checked before leaving
   
4. **TownLevel** &rarr; explore the railcars to find the gun; triggers final cutscene
   
5. **LevelComplete** &rarr; level completion screen with button to return to start
---
> [!NOTE]
> ## 🎮 Controls
> - Move: Arrow Keys / WASD
>
> - Interact: Enter
>  
> - Pause: Escape
>
> - Confirm Warp: Y / N
>
> - Speed up Cutscene: Hold S
---

## ✅ Project Goals
This project demonstrates:
- 🎮 Player movement, animations, and directional interaction

- 🗨️ Interactive dialogue system with typewriter effect

- 🎥 Intro and outro cutscenes with audio and visual polish

- ⚡ Dynamic game state and object tracking via autoloaded manager

- 💥 Collision-based interaction and environment navigation

- 🎵 Global audio playback and sound feedback integration

---

## 🎭 Team Roles
- 🤠 **[@AngelaRileyScott](https://github.com/AngelaRileyScott)** - Narrative Design & Environment Artist 

- 🤠 **[@gwperaza](https://github.com/gwperaza)** - Character Artist & Gameplay Assets

- 🤠 **[@apace26](https://github.com/apace26)** - Developer & QA

- 🤠 **[@jenschrad](https://github.com/jenschrader)**  - Developer & Game Design

---

## 🎨 Asset Credits
Special thanks to the creators of the free assets used in this project:

- 🔫 **Gunshot Sound Effect**  
  [Gunshot Sounds – OpenGameArt.org](https://opengameart.org/content/gunshot-sounds)

- 🎼 **Western Music Track**  
  [Western – OpenGameArt.org](https://opengameart.org/content/western)

- 🌄 **Opening and Ending Backgrounds**  
  [Layered Scrolling Backgrounds – OpenGameArt.org](https://opengameart.org/content/several-scrolling-backgrounds-and-layerable-runners)

- ⌨️ **Typewriter Sound Effect**  
  [Typewriter Button Slide – Pixabay](https://pixabay.com/sound-effects/typewriter-button-slide-1a-47722/)

All assets are used under their respective licenses for educational purposes.

---

> ## **Thanks for playing 🤠🎯**  
> *...and don't forget to stay sharp, little sure shot.* ✨

---

<br> 


🔹 *Spring 2025* 🔹 *SDEV-248: Advanced Simulation & Game Design* 🔹 *Created with* ❤️ *using Godot Engine 4.4* 🔹 

