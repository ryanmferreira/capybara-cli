# Capybara CLI

A friendly capybara that says anything you want... right in your terminal.

This is a simple terminal utility, mainly created as a hobby project to explore package management across different systems. Nothing too serious but capybaras are awesome, aren't they?

---

## Installation

### Arch Linux (AUR)

If you are on Arch Linux, CachyOS, or any Arch-based distro, you can install it using your favorite AUR helper:

```bash
paru -S capybara-cli

# or

yay -S capybara-cli
```

### Windows (Scoop)

It is also available as a Scoop bucket:

```powershell
scoop bucket add capybara https://github.com/ryanmferreira/capybara-cli`
scoop install capybara
```

---

## Usage

After installing with Scoop (or compiling from source), just run:

```bash
capybara "your message here"
```

#### Example output

```plaintext
    /\__/\_
   /       \
  /    0    \----------_
 | Y                    \  your message here
 \______/                \
       \                 |
        |   /-______-|    \
        |   |         \   /
       //__/         //__/
```

### Passing text files

You can also pass a file to the capybara:

```bash
capybara ~/message.txt
```

#### If no argument is passed, it defaults to

```plaintext
Capybara supremacy!
```

---

## Building from Source

To build manually, you need Premake5, Ninja, and a C++ compiler (Clang recommended for cross-compilation).

1. Clone the repository:

    ```bash
    git clone https://github.com/RyanM-Ferreira/capybara-cli.git
    cd capybara-cli
    ```

2. Generate the build files:
You can specify the target Operating System (linux, windows, macosx, or bsd):

    ```bash
    premake5 ninja --os=linux // or any other supported OS
    ```

3. **Compile for a specific architecture:**
List all available targets using `ninja -t targets`. To compile, specify the configuration and architecture:

```bash
    # Build for x86_64 (Default)
    ninja release_x86_64

    # Build for other architectures (ARM, ARM64, RISCV64, etc.)
    ninja release_ARM64
```

> *The binary will be located in `bin/{os}_{architecture}_{config}/`.*

---

## License

[MIT License](LICENSE) - Do whatever you want... just be nice to capybaras.

---

> Done for no particular reason, and maybe a little coffee.
