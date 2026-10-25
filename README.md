# ISS SURVIVAL
Our project is a game that teaches the players the various tasks that someone on the ISS will have to perform in order to come back to Earth safely and with useful data.

It is based on a short gameplay loop of exercising and performing research minigames at the cost of energy, with occasional maintence events that will disable a minigame until fixed.

## Team
Kat Calcagno, Brett Core
## About
We built a simple game using mainly Godot and its scripting language that shows the "daily life" of someone who is on the ISS.\
\
To people who have no idea what goes on up there and why they do it, this game serves an invaluable informational tool while also being fun to play.\
Some of the things it teaches is how important it is to exercise in space so you can return to Earth, how important researching is to make the best of your time in space, and how serious maintence is.\
\
To do this, we made it so the player gets various endings after a few years in space when they return to Earth.  If they didn't exercise at all, they will experience a variety of sideeffects, and if they didn't research they would get in trouble with their space agency.\
\
No external APIs or AI generated code was used. (any ai used was an advanced search for godot documentation)
# Prerequisites 
Currently any system that can run Godot can be used, Windows is perferred and Linux has been show to produce minor errors\
\
Latest version of the Godot engine (https://godotengine.org/download/windows/)\
Access to git/github, perferably the desktop version of github.

# How to Build from Source
Pulling the Repo:\
	\
	Option 1 (github desktop app):\
		- `Simply press the pull origin button after linking the repo from https://github.com/KatLuvsYa3/Geaux_Hackathon_Godot\`
\
	Option 2 (commandline git):\
		- `git clone https://github.com/KatLuvsYa3/Geaux_Hackathon_Godot && cd project\`
\
Open the new project on Godot to edit and debug it.\
To build the project, open the project in the Godot Editor and find the Taskbar at the top of the screen. Navigate to `Editor->Manage Export Templates` and dowload the desired target export template. Finally, navigate to `Project->Export`, pick your preset, and then click `Export Project`.
