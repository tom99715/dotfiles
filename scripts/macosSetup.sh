#!/bin/bash

# Run "chmod +x macos-setup.sh" if this is not executable

CONFIG_DIR="$HOME/.config"

install_brew_packages() {
    echo "Installing Homebrew packages..."
    brew install abseil icu4c@75 mysql tmux bash libevent ncurses tree btop libuv fastfetch tree-sitter \
    ca-certificates libvterm neovim unibilium cmake cmatrix lpeg openssl@3 utf8proc docker lua \
    pcre2 xz docker-completion luajit powerlevel10k zlib fswatch luarocks protobuf zsh-autocomplete \
    gettext luv readline zsh-syntax-highlighting gh lz4 screenresolution zstd git msgpack sqlite ranger
}

echo ""
echo "----- Installing Homebrew Packages -----"

# Check if Homebrew is installed
if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is already installed."
else
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to the PATH for this script
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

install_brew_packages

echo ""
echo "----- Installing Programs and Plugins -----"

# Check if Oh My Zsh is installed
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed."
else
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Check if Kitty is installed
if command -v kitty >/dev/null 2>&1; then
    echo "Kitty is already installed."
else
    echo "Installing Kitty..."
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

# Check if Rye is installed
if command -v rye >/dev/null 2>&1; then
    echo "Rye is already installed."
else
    echo "Installing Rye..."
    curl -sSf https://rye.astral.sh/get | bash
fi

# Check if TPM is installed
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "TPM is already installed."
else
    echo "Installing TPM ..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo ""
echo "----- Installing Fonts -----"

# Set the path to the fonts directory
FONT_DIR="$CONFIG_DIR/fonts"

# Check if the fonts directory exists and install fonts
if [ -d "$FONT_DIR" ]; then
    echo "Installing fonts from $FONT_DIR..."

    # Use find to get all .ttf and .otf font files in the directory
    find "$FONT_DIR" -type f \( -iname "*.ttf" -o -iname "*.otf" \) | while read -r font; do
        font_name=$(basename "$font")
        # Check if the font is already installed
        if [ -e "/Library/Fonts/$font_name" ]; then
            echo "$font_name is already installed."
        else
            echo "Installing $font_name..."
            sudo cp -v "$font" /Library/Fonts/
        fi
    done

    echo "Fonts installed successfully."
else
    echo "Font directory $FONT_DIR does not exist."
fi

echo ""
echo "----- Creating Symbolic Links -----"

# Create symbolic links for .zshrc, .zprofile, and .p10k.zsh in the home directory
if [ -d "$CONFIG_DIR" ]; then
    echo "Creating symbolic links for dotfiles..."

    create_symlink() {
        local target=$1
        local link=$2
        if [ -e "$link" ]; then
            if [ -L "$link" ]; then
                echo "Failed to create symbolic link for $(basename "$link"): A symbolic link already exists."
                echo "The existing symbolic link points to: $(readlink "$link")"
            elif [ -f "$link" ]; then
                echo "Failed to create symbolic link for $(basename "$link"): A regular file exists at $link."
            elif [ -d "$link" ]; then
                echo "Failed to create symbolic link for $(basename "$link"): A directory exists at $link."
            else
                echo "Failed to create symbolic link for $(basename "$link"): An unknown type of file exists."
            fi
        else
            ln -s "$target" "$link" || echo "Failed to create symbolic link for $(basename "$link")"
        fi
    }

    # Creating symbolic links for .zshrc, .zprofile, and .p10k.zsh
    create_symlink "$CONFIG_DIR/zsh/.zshrc" "$HOME/.zshrc"
    create_symlink "$CONFIG_DIR/zsh/.zprofile" "$HOME/.zprofile"
    create_symlink "$CONFIG_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

    echo "Symbolic links creation process completed."
else
    echo "$CONFIG_DIR does not exist. Please ensure the .config directory exists."
fi

# Enable touch ID for sudo commands
sed -e 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local

echo "Setup complete! Run tmux, prefix + I to install plugins."

echo ""

echo "Check uBlock Origin and Dark Reader in Firefox to make sure they are syncing correctly"

echo ""

echo "Check remaining Firefox extensions to make sure your settings are correct"
