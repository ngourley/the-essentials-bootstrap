#!/bin/bash
# This script is used to bootstrap a macOS system with the necessary tools and configurations.

log_message() {
    local level="$1"
    local message="$2"
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] [$level] $message"
}

function clearTerminal() {
    # Save cursor position
    printf '\033[s'
    # Move the cursor up 1 line
    printf '\033[1A'
    # Clear the screen
    printf '\033[1J'
    # Restore cursor position
    printf '\033[u'
}

clearTerminal

log_message "INFO" "Bootstrapping MacOS environment"

log_message "INFO" "Checking for brew..."

# Location of brew executable
brew_path="/opt/homebrew/bin/brew"

# Check if brew is installed
# Install brew if not installed
if [ -f "$brew_path" ]; then
    log_message "INFO" "brew is installed"
else
    echo "brew is not installed"
    echo "installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Confirming existence of .zshrc file
zshrc_path="$HOME/.zshrc"

if [ -f "$zshrc_path" ]; then
    log_message "INFO" "zshrc file exists"
else
    log_message "WARN" "zshrc file does not exist, creating..."
    touch "$zshrc_path"
fi

# Confirm brew is in PATH
if ! command -v brew &> /dev/null; then
    log_message "ERROR" "brew could not be found in PATH"
    log_message "INFO" "Adding brew to PATH"
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >> "$zshrc_path"
else
    log_message "INFO" "brew is in PATH"
fi

log_message "INFO" "ansible and git will be used for configuration management"

log_message "INFO" "Checking for ansible..."

# Check if ansible is installed
# Install ansible if not installed
if ! command -v ansible &> /dev/null; then
    log_message "ERROR" "ansible could not be found in PATH"
    log_message "INFO" "Installing ansible"
    brew install ansible
else
    log_message "INFO" "ansible installed"
fi

log_message "INFO" "Checking for git..."

# Check if git is installed
# Install git if not installed
if ! command -v git &> /dev/null; then
    log_message "ERROR" "git could not be found in PATH"
    log_message "INFO" "Installing ansible"
    brew install git
else
    log_message "INFO" "git installed"
fi

# All bootstrap scripts should end before this line
log_message "INFO" "Bootstrapping completed"