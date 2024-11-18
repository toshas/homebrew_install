# Homebrew (un)installer

## A fork designed to simplify installation in Linux in user space (without sudo)

Simply run the following commands to apply the linux installation patch (exposing `$HOMEBREW_PREFIX` variable) to the upstream Homebrew `install.sh` script.

```bash
export HOMEBREW_PREFIX="${HOME}/.homebrew"
export NONINTERACTIVE=1
mkdir -p "${HOMEBREW_PREFIX}"
wget -O install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
wget -O linux_fix.patch https://raw.githubusercontent.com/toshas/homebrew_install/HEAD/linux_fix.patch
patch -p1 < linux_fix.patch
/bin/bash install.sh
```

This exact code is contained in the [linux_installer_latest.sh](linux_installer_latest.sh) file.

**Question**: Why is this not submitted as a pull request against the upstream?

**Answer**: Because of an early design choice and maintainers' [decision](https://github.com/Homebrew/install/issues/668#issuecomment-1153600568) to not break backward compatibility.

## Install Homebrew (on macOS or Linux)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

More installation information and options: <https://docs.brew.sh/Installation>.

If you're on macOS, try out our new `.pkg` installer. Download it from [Homebrew's latest GitHub release](https://github.com/Homebrew/brew/releases/latest).

If you are running Linux or WSL, [there are some pre-requisite packages to install](https://docs.brew.sh/Homebrew-on-Linux#requirements).

You can set `HOMEBREW_NO_INSTALL_FROM_API` to tap Homebrew/homebrew-core; by default, it will not be tapped as it is no longer necessary.

You can set `HOMEBREW_BREW_GIT_REMOTE` and/or `HOMEBREW_CORE_GIT_REMOTE` in your shell environment to use geolocalized Git mirrors to speed up Homebrew's installation with this script and, after installation, `brew update`.

```bash
export HOMEBREW_BREW_GIT_REMOTE="..."  # put your Git mirror of Homebrew/brew here
export HOMEBREW_CORE_GIT_REMOTE="..."  # put your Git mirror of Homebrew/homebrew-core here
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

The default Git remote will be used if the corresponding environment variable is unset.

If you want to run the Homebrew installer non-interactively without prompting for passwords (e.g. in automation scripts), you can use:

```bash
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Uninstall Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```

If you want to run the Homebrew uninstaller non-interactively, you can use:

```bash
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```

If you want to to uninstall Homebrew from a specific prefix (e.g. when migrating from Intel to Apple Silicon processors), download the uninstall script and run it with `--path`:

```
curl -fsSLO https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh
/bin/bash uninstall.sh --path /usr/local
```

Run the downloaded script with `/bin/bash uninstall.sh --help` to view more uninstall options.
