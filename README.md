# Kaplan’s MacOS Setup

I've found myself sending my tips and configurations to friends and colleagues so many times, I decided to create this repo to make it easier for me to share my setup.

This is a guide for people who are new to Mac, or for people who are looking for a better setup.

This is a work in progress, I will add more stuff as I go.

## If you are unfamiliar with Mac

What you need to know:

- Full screen apps sucks, don’t press the green maximize button.
- Almost everything you used to use `Ctrl` for, is now `Cmd`
- `Home` + `End` (goto start / end of line) → `Cmd + Arrow keys`
- Switch language → The default is `Ctrl + Space`, I suggest changing it to `Option + Space` since `Ctrl + Space` is reserved for vscode autocompletion.
- Don’t use the dock to launch apps, get used to do everything with Spotlight (default) or Raycast (recommended) by pressing `Cmd+Space`
- `Cmd + W` closes windows, `Cmd + Q` closes apps
    - Apps can stay open even when there are no windows
        
        Its common to open an app (say, WhatsApp) and close its windows, the app will remain open, it just won’t have any windows.
        
- Finder (mac’s version of `Explorer.exe`) sucks, don’t use it unless you have to, prefer using the terminal.
  - If using my configuration, use `br` to find directories.
- When you are in terminal - you can use `open <path>` to open the path in finder / default app for this file.
    - For example, I can open the current working directory by entering `open .`
    - Or open an image using `open myimage.png`

## Settings to change

- Settings → Keyboard:
    - Key repeat rate to Fastest
    - Delay until repeat to Shortest
    - Keyboard Shortcuts
        - Input Sources
            - Change to Option + Space
- Finder
    - Settings → Advanced
        - Show all filename extensions
    - Change view to list and then:
        - Right click → Show view options → Always open in list view → Use as default

## Recommended apps
| Name                                                               | Description                                                                                                                                                                                                                                                           |
| ------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Raycast](https://raycast.com)                                     | The holy grail of all tools, a must have launcher, it handles<br>1. Application launching <br>2. Windows switching<br>3. Windows management<br>4. Base64/Hex encode-decode<br>5. Easy to use MFA<br>6. Clipboard history<br>7. Calculator & converter<br>8. More!<br> |
| [AltTab](https://alt-tab-macos.netlify.app)                        | A better CMD+Tab, it switches between windows instead of apps.                                                                                                                                                                                                        |
| [Iterm2](https://iterm2.com)                                       | A much better terminal.<br>Recommended profile: [Default.json](iterm/Default.json)                                                                                                                                                                                    |
| [CapsLockNoDelay](https://github.com/gkpln3/CapsLockNoDelay)       | For some reason there is a delay when you press the caps lock key to activate it, this tool disables it.<br>Also open source and is written by [@gkpln3](https://github.com/gkpln3) 🙂                                                                                 |
| [MonitorControl](https://github.com/MonitorControl/MonitorControl) | Allows you to control brightness and volume of external monitors through the usual macos keys.                                                                                                                                                                        |
| [ImHex](https://github.com/WerWolv/ImHex) | A very nice and advanced hex editor |


### Terminal stuff
| Name                    | Description                                     | Install command                                                                                   |
| ----------------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| [brew](https://brew.sh) | Package manager (like apt)                      | `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` |
| fzf                     | Fuzzy search                                    | `brew install fzf`                                                                                |
| jless                   | Like `less` but for json / yaml files           | `brew install jless`                                                                              |
| bat (batcat)            | Like `cat`, but with syntax highlighting        | `brew install bat`                                                                                |
| oh-my-zsh               | Better terminal                                 | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |
| qlmarkdown              | Quick look (space in finder) for markdown files | `brew install qlmarkdown`                                                                         |
    
    
### Raycast
After you install Raycast, remove the Spotlight keybinding, and bind Raycast to cmd+space
You can bind commands to key shortcuts from the raycast menu.

I recommend binding the following commands to a key shortcut:
| Name                           | Shortcut                |
| ------------------------------ | ----------------------- |
| Clipboard History              | `cmd + shift + space`   |
| Search Emoji & Symbols         | `ctrl + cmd + space`    |
| Window Management / Left Half  | `ctrl + option + left`  |
| Window Management / Right Half | `ctrl + option + right` |
| Window Management / Maximize   | `ctrl + option + up`    |

#### Recommended Raycast plugins
Enter “Store” in the Raycast prompt
- Base64
- Hexlify (by [@gkpln3](https://github.com/gkpln3))
- 2FA
- Kill Process
- Port Manager
