#!/bin/bash

# Advanced Hyprland Installation Script by Js Bro ( https://github.com/me-js-bro )

# color defination
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
blue="\e[1;34m"
megenta="\e[1;1;35m"
cyan="\e[1;36m"
orange="\x1b[38;5;214m"
end="\e[1;0m"

if command -v gum &> /dev/null; then

display_text() {
    gum style \
        --border rounded \
        --align center \
        --width 60 \
        --margin "1" \
        --padding "1" \
'
   __ __                            ___
  / // /_ _____  ___________  ___  / _/
 / _  / // / _ \/ __/ __/ _ \/ _ \/ _/ 
/_//_/\_, / .__/_/  \__/\___/_//_/_/   
     /___/_/                                
'
}

else
display_text() {
    cat << "EOF"
   __ __                            ___
  / // /_ _____  ___________  ___  / _/
 / _  / // / _ \/ __/ __/ _ \/ _ \/ _/ 
/_//_/\_, / .__/_/  \__/\___/_//_/_/   
     /___/_/                              

EOF
}
fi

clear && display_text
printf " \n \n"

###------ Startup ------###

# finding the presend directory and log file
dir="$(dirname "$(realpath "$0")")"
# log directory
log_dir="$dir/Logs"
log="$log_dir"/dotfiles.log
mkdir -p "$log_dir"
touch "$log"

# message prompts
msg() {
    local actn=$1
    local msg=$2

    case $actn in
        act)
            printf "${green}=>${end} $msg\n"
            ;;
        ask)
            printf "${orange}??${end} $msg\n"
            ;;
        dn)
            printf "${cyan}::${end} $msg\n\n"
            ;;
        att)
            printf "${yellow}!!${end} $msg\n"
            ;;
        nt)
            printf "${blue}\$\$${end} $msg\n"
            ;;
        skp)
            printf "${magenta}[ SKIP ]${end} $msg\n"
            ;;
        err)
            printf "${red}>< Ohh sheet! an error..${end}\n   $msg\n"
            sleep 1
            ;;
        *)
            printf "$msg\n"
            ;;
    esac
}


# Directories ----------------------------
hypr_dir="$HOME/.config/hypr"
scripts_dir="$hypr_dir/scripts"
fonts_dir="$HOME/.local/share/fonts"

msg act "Now setting up the pre installed Hyprland configuration..."sleep 1

mkdir -p ~/.config



# =========  checking the distro  ========= #

check_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            arch)
                distro="arch"
                ;;
            fedora)
                distro="fedora"
                ;;
            opensuse*)
                distro="opensuse"
                ;;
        esac
    fi
}

dirs=(
    btop
    dunst
    fastfetch
    fish
    gtk-3.0
    gtk-4.0
    hypr
    kitty
    Kvantum
    nvim
    qt5ct
    qt6ct
    rofi
    waybar
    yazi
)

# Paths
backup_dir="$HOME/.temp-back"
keybinds_backup="$backup_dir/keybinds.conf"
wrules_backup="$backup_dir/wrules.conf"
wallpapers_backup="$backup_dir/Wallpaper"
hypr_cache_backup="$backup_dir/.cache"
keybinds="$HOME/.config/hypr/configs/keybinds.conf"
wrules="$HOME/.config/hypr/configs/wrules.conf"
wallpapers="$HOME/.config/hypr/Wallpaper"
hypr_cache="$HOME/.config/hypr/.cache"

# Ensure backup directory exists
mkdir -p "$backup_dir"

# Function to handle backup/restore
backup_or_restore() {
    local file_path="$1"
    local file_type="$2"

    if [[ -e "$file_path" ]]; then
        msg att "A $file_type has been found."
        if command -v gum &> /dev/null; then
            gum confirm "Would you Restore it or put it into the Backup?" \
                --affirmative "Restore it.." \
                --negative "Backup it..."
            echo

            if [[ $? -eq 0 ]]; then
                action="r"
            else
                action="b"
            fi

        else
            msg ask "Would you Restore it or put it into the Backup? [ r/b ]"
            read -r -p "$(echo -e '\e[1;32mSelect: \e[0m')" action
        fi

        if [[ "$action" =~ ^[rR] ]]; then
            cp -r "$file_path" "$backup_dir/"
        else
            msg att "$file_type will be backed up..."
        fi
    fi
}

# Backing up keybinds, wrules, and wallpapers
backup_or_restore "$keybinds" "keybinds config file"
backup_or_restore "$wrules" "window rules config file"
backup_or_restore "$wallpapers" "wallpaper directory"
cp -r "$hypr_cache" "$backup_dir/"

# if some main directories exists, backing them up.
if [[ -d "$HOME/.config/HyprBackup-${USER}" ]]; then
    msg att "a HyprBackup directory was there. Archiving it..."
    cd "$HOME/.config"
    mkdir -p "HyprArchive-${USER}"
    zip -r -1 "HyprBackup-${USER}.zip" "HyprBackup-${USER}" &> /dev/null
    mv "HyprBackup-${USER}.zip" "HyprArchive-${USER}/"
    rm -rf "HyprBackup-${USER}"
    msg dn "HyprBackup-${USER} was zipped and backed to HyprArchive-${USER} directory..."
fi

for confs in "${dirs[@]}"; do
    mkdir -p "$HOME/.config/HyprBackup-${USER}"
    dir_path="$HOME/.config/$confs"
    if [[ -d "$dir_path" ]]; then
        mv "$dir_path" "$HOME/.config/HyprBackup-${USER}/" 2>&1 | tee -a "$log"
    fi
done

[[ -d "$HOME/.config/HyprBackup-${USER}" ]] && msg dn "Everything has been backuped in $HOME/.config/HyprBackup-${USER}..."

sleep 1

#_____ if OpenBangla Keyboard is installed
keyboard_path="/usr/share/openbangla-keyboard"

if [[ -d "$keyboard_path" ]]; then
    msg act "Setting up OpenBangla-Keyboard..."

    # Add fcitx5 environment variables to /etc/environment if not already present
    if ! grep -q "GTK_IM_MODULE=fcitx" /etc/environment; then
        printf "\nGTK_IM_MODULE=fcitx\n" | sudo tee -a /etc/environment 2>&1 | tee -a >(sed 's/\x1B\[[0-9;]*[JKmsu]//g' >> "$log") &> /dev/null
    fi

    if ! grep -q "QT_IM_MODULE=fcitx" /etc/environment; then
        printf "QT_IM_MODULE=fcitx\n" | sudo tee -a /etc/environment 2>&1 | tee -a >(sed 's/\x1B\[[0-9;]*[JKmsu]//g' >> "$log") &> /dev/null
    fi

    if ! grep -q "XMODIFIERS=@im=fcitx" /etc/environment; then
        printf "XMODIFIERS=@im=fcitx\n" | sudo tee -a /etc/environment 2>&1 | tee -a >(sed 's/\x1B\[[0-9;]*[JKmsu]//g' >> "$log") &> /dev/null
    fi

fi

#_____ for virtual machine
# Check if the configuration is in a virtual box
if hostnamectl | grep -q 'Chassis: vm'; then
    msg att "You are using this script in a Virtual Machine..."
    msg act "Setting up things for you..." 
    sed -i '/env = WLR_NO_HARDWARE_CURSORS,1/s/^#//' "$dir/config/hypr/configs/environment.conf"
    sed -i '/env = WLR_RENDERER_ALLOW_SOFTWARE,1/s/^#//' "$dir/config/hypr/configs/environment.conf"
    echo -e '#Monitor\nmonitor=Virtual-1, 1920x1080@60,auto,1' > "$dir/config/hypr/configs/monitor.conf"

else
    #_____ setting up the monitor
    msg act "Setting the default monitor setup..."
    echo -e "#Monitor\nmonitor=,preferred,auto,auto" > "$dir/config/hypr/configs/monitor.conf"
fi


#_____ for nvidia gpu. I don't know if it's gonna work or not. Because I don't have any gpu.
# uncommenting WLR_NO_HARDWARE_CURSORS if nvidia is detected
if lspci -k | grep -A 2 -E "(VGA|3D)" | grep -iq nvidia; then
  msg act "Nvidia GPU detected. Setting up proper env's" 2>&1 | tee -a >(sed 's/\x1B\[[0-9;]*[JKmsu]//g' >> "$log") || true
  sed -i '/env = WLR_NO_HARDWARE_CURSORS,1/s/^#//' config/hypr/configs/environment.conf
  sed -i '/env = LIBVA_DRIVER_NAME,nvidia/s/^#//' config/hypr/configs/environment.conf
  sed -i '/env = __GLX_VENDOR_LIBRARY_NAME,nvidia/s/^# //' config/hypr/configs/environment.conf
fi

sleep 1

# cloning the dotfiles repository into ~/.config/hypr
cp -r "$dir/config"/* "$HOME/.config/"
sleep 1

if [[ -d "$scripts_dir" ]]; then
    # make all the scripts executable...
    chmod +x "$scripts_dir"/* 2>&1 | tee -a "$log"
    msg dn "All the necessary scripts have been executable..."
    sleep 1
else
    msg err "Could not find necessary scripts.."
fi

# Install Fonts
msg act "Installing some fonts..."
if [[ ! -d "$fonts_dir" ]]; then
	mkdir -p "$fonts_dir"
fi

cp -r "$dir/extras/fonts" "$fonts_dir"
msg act "Updating font cache..."
sudo fc-cache -fv 2>&1 | tee -a "$log" &> /dev/null


wayland_session_dir=/usr/share/wayland-sessions
if [ -d "$wayland_session_dir" ]; then
    msg att "$wayland_session_dir found..."
else
    msg att "$wayland_session_dir NOT found, creating..."
    sudo mkdir $wayland_session_dir 2>&1 | tee -a "$log"
fi
    sudo cp "$dir/extras/hyprland.desktop" /usr/share/wayland-sessions/ 2>&1 | tee -a "$log"


# restore the backuped items into the original location
restore_backup() {
    local backup_path="$1"      # Path to the backup file/directory
    local original_path="$2"    # Original file/directory path
    local file_type="$3"        # Description of the file/directory

    if [[ -e "$backup_path" ]]; then
        # Create a backup of the current file/directory if it exists
        if [[ -e "$original_path" ]]; then
            mv "$original_path" "${original_path}.backup"
        fi

        # Restore the file/directory from the backup
        if cp -r "$backup_path" "$original_path"; then
            msg dn "$file_type restored to its original location: $original_path."
        else
            msg err "Could not restore defaults."
        fi
    fi
}

# Restore files
restore_backup "$keybinds_backup" "$keybinds" "keybinds config file"
restore_backup "$wrules_backup" "$wrules" "window rules config file"
restore_backup "$wallpapers_backup" "$wallpapers" "wallpaper directory"

# restoring hyprland cache
[[ -e "$HOME/.config/hypr/.cache" ]] && rm -rf "$HOME/.config/hypr/.cache"
[[ -e "$hypr_cache_backup" ]] && cp -r "$hypr_cache_backup" "$hypr_cache"
rm -rf "$backup_dir"

clear && sleep 1



# Asking if the user wants to download more wallpapers
if [[ -n "$(command -v gum)" ]]; then
    msg ask "Would you like to add more wallpapers?"
    gum confirm "Please confirm." \
        --prompt.foreground "#ff8700" \
        --selected.background "#00FFFF" \
        --selected.foreground "#000" \
        --affirmative "Need more wallpapers" \
        --negative "No, skip"

    if [ $? -eq 0 ]; then
       wallpaper="y" 
    else
        wallpaper="n"
    fi
else
    msg ask "Would you like to add more ${green}Wallpapers${end}? ${blue}[ y/n ]${end}..."
    read -r -p "$(echo -e '\e[1;32mSelect: \e[0m')" wallpaper
fi

printf " \n"

# wallpaper...
if [[ "$wallpaper" =~ ^[Y|y]$ ]]; then
    msg act "Downloading some wallpapers..."
    
    # cloning the wallpapers in a temporary directory
    git clone --depth=1 https://github.com/me-js-bro/Wallpapers.git ~/.cache/wallpaper-cache 2>&1 | tee -a "$log" &> /dev/null

    # copying the wallpaper to the main directory
    if [[ -d "$HOME/.cache/wallpaper-cache" ]]; then
        cp "$HOME/.cache/wallpaper-cache/dark"/* ~/.config/hypr/Dynamic-Wallpapers/dark/ &> /dev/null
        cp "$HOME/.cache/wallpaper-cache/light"/* ~/.config/hypr/Dynamic-Wallpapers/light/ &> /dev/null
        cp "$HOME/.cache/wallpaper-cache/all"/* ~/.config/hypr/Wallpaper/ &> /dev/null
        rm -rf "$HOME/.cache/wallpaper-cache" &> /dev/null
        msg dn "Wallpapers were downloaded successfully..." 2>&1 | tee -a >(sed 's/\x1B\[[0-9;]*[JKmsu]//g' >> "$log") & sleep 0.5
    else
        msg err "Sorry, could not download more wallpapers. Going forward with the limited wallpapers..." 2>&1 | tee -a >(sed 's/\x1B\[[0-9;]*[JKmsu]//g' >> "$log") && sleep 0.5
    fi
fi

# =========  wallpaper section  ========= #

check_distro &> /dev/null

if [[ -d "$HOME/.config/hypr/Wallpaper" ]]; then
    engine="$HOME/.config/hypr/.cache/.engine"
    wallCache="$HOME/.config/hypr/.cache/.wallpaper"

    touch "$engine" &> /dev/null
    touch "$wallCache" &> /dev/null
      
    echo "hyprpaper" > "$engine"

    if [ -f "$HOME/.config/hypr/Wallpaper/${distro}.png" ]; then
        echo "$distro" > "$wallCache"
        wallpaper="$HOME/.config/hypr/Wallpaper/${distro}.png"
    fi

    # setting the default wallpaper
    ln -sf "$wallpaper" "$HOME/.config/hypr/.cache/current_wallpaper.png"
    echo "wallpaper = ,~/.config/hypr/.cache/current_wallpaper.png" > "$HOME/.config/hypr/hyprpaper.conf"
fi

# setting up the waybar
ln -sf "$HOME/.config/waybar/configs/catppuccin-top" "$HOME/.config/waybar/config"
ln -sf "$HOME/.config/waybar/style/catppuccin-top.css" "$HOME/.config/waybar/style.css"
"$HOME/.config/hypr/scripts/pywal.sh" &> /dev/null

# setting default themes, icon and cursor
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "TokyoNight-SE"
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Ice"

msg dn "Script execution was successful! Now you can reboot and enjoy your customization..." && sleep 1

# === ___ Script Ends Here ___ === #
