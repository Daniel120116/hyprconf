<h1 align="center">Minimal Hyprland Configuration</h1>
<h3 align="center">By</h3>
<h2 align="center">Js Bro ( Md. Mahin Islam Mahi )</h2>
<br>

<h3>This Hyprland configuration is kind of minila looking, but also little bit gorgeous I guess. Why don't you check it out? </h3>

## Screenshots

<details close>
<summary>Themes</summary>
<p align="center">
   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/theme/1.png?raw=true" />
   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/theme/2.png?raw=true" /> <br>

   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/theme/3.png?raw=true" />
   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/theme/4.png?raw=true" />
</p> <br>
</details>

<details close>
<summary>Menu</summary>
<p align="center">
   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/menu/1.png?raw=true" />
   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/menu/2.png?raw=true" /> <br>

   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/menu/4.png?raw=true" />
   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/menu/3.png?raw=true" />
    <br>

   <img aligh="center" width="99%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/clipboard.png?raw=true" />
</p> <br>
</details>

<details close>
<summary>Power Menu</summary>
<p align="center">
   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/power/1.png?raw=true" />
   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/power/2.png?raw=true" /> <br>

   <img aligh="center" width="99%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/power/3.png?raw=true" />
</p> <br>
</details>

<details close>
<summary>Wallpaper</summary>
<p align="center">
   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/wallpaper/1.png?raw=true" />
   <img aligh="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/wallpaper/2.png?raw=true" /> <br>

   <img aligh="center" width="99%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/wallpaper/3.png?raw=true" />
</p> <br>
</details>

<details close>
<summary>Lock Screen</summary>
<p align="center">
   <img aligh="center" width="99%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/lock.png?raw=true" />
</p>
</details>

<details close>
<summary>Login Screen (sddm)</summary>
<p align="center">
   <img aligh="center" width="99%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/hyprconf/sddm/sddm_theme.jpg?raw=true" />
</p>
</details>

<br>

## Features

- <h4>Dynamic Wallpaper changing script</h4>
- <h4>Change colors according to the changed wallpaper (pywal)</h4>
  <!-- - <h4>Light and Dark Mode</h4> -->
- <h4>Select and Open apps using Rofi app launcher</h4>
- <h4>Gorgeous looking Waybar styles</h4>
- <h4>Rofi app launcher styles</h4>
- <h4>Rofi power menu</h4>
- <h4>Opening some web pages as single tab (chatGPT, Gemini, Facebook, YouTube, WhatsApp, Photopea)</h4>
- <h4>Locking with Hyprlock</h4>
- <h4>Set your user image in Hyprlock ( a script `~/.config/hypr/add_user.sh` to set your user image )</h4>
- <h4>Hypridle to handle auto lock and suspend when no action is running </h4>
- <h4>Hyprsunset to use nightlight, `SUPER` + F1 to increase, `SUPER` + F2 to decrease and `SUPER` + F3 to set to default </h4>
  <br>

## Configure for OpenBangla-Keyboard ( to write in bangla )

<details close>
<summary>Setup OpenBangla-Keyboard</summary>
<h4>
If you have OpenBangla-Keyboard installed, then you need to follow some steps to add the keyboard in fcitx5. Just follow the instructions bellow.
</h4>
<h4>1) Right click on this keyboard icon in you waybar.</h4>

<img src="https://github.com/me-js-bro/Screen-Shots/blob/main/openbangla/step-1.jpg?raw=true" /> <br>

<h4>2) Search for "openbangla" and select the keyboard</h4>
<img src="https://github.com/me-js-bro/Screen-Shots/blob/main/openbangla/step-2.jpg?raw=true" /> <br>
<h4>3) Now add the keyboard by clicking the 'right aero' icon and click on apply.</h4>
<img src="https://github.com/me-js-bro/Screen-Shots/blob/main/openbangla/step-3.jpg?raw=true" /> <br>

<h4>Now you can switch keyboard using "CTRL + Space"</h4> <br>
</details>

## Installation

<h4>To install and setup this hyprland configuration automaticly, just follow these stpes...</h4>

- Clone this repository:

```
   git clone --depth=1 https://github.com/me-js-bro/hyprconf.git
```

- Now run this commands:
  ```
  cd ~/hyprconf
  chmod +x setup.sh
  ./setup.sh
  ```

## Update

<h4>To Update into the latest commit. jusr run this command in your tarminal..</h4>

```shell
bash -c "$(wget -q  https://raw.githubusercontent.com/me-js-bro/hyprconf/main/update.sh -O -)"
```

- Hurrah! Now reboot your system, select Hyprland from your login manager, log into your Hyprland and enjoy it.
<hr> <br>

## -----------(O_O)-----------

#### Well if you want to automate the required packages installation process and setup this config automaticly. then you should visit [This Repository](https://github.com/me-js-bro/hyprconf-install.git). I will automate the process for you.

<br>

## Keyboard Shortcuts

After installation, just press the `SUPER + Shift + h`. It will show you all the keybinds.

## Contribute.

<h4>
If you want to add your ideas in this project, just do some steps.
</h4>

1. Fork this repository. Make sure to uncheck the `Copy the main branch only`. This will also copy other branches ( if available ).
2. Now clone the forked repository in you machine. <br> Example command:

```
git clone --depth=1 https://github.com/your_user_name/hyprconf.git
```

3. Create a branch by your user_name. <br> Example command:

```
git checkout -b your_user_name
```

4. Now add your ideas and commit to github. <br> Make sure to commit with a detailed test message. For example:

```
git commit -m "fix: Fixed a but in the "example.sh script"
```

```
git commit -m "add: Added this feature. This will happen if the user do this."
```

```
git commit -m "delete: Deleted this. It was creating this example problem"
```

4. While pushing the new commits, make sure to push it to your branch. <br> For example:

```
git push origin your_branch_name
```

5. Now you can create a pull request in the main repository.<br> But make sure to create the pull request in the `development` branch, no the `main` branch.

### Thats all about contributing.

## Reference

#### I would like to thank [JaKooLit](https://github.com/JaKooLit). I was inspired from his Hyprland installation scripts and prepared my script. I took and modified some of his scripts and used here.
