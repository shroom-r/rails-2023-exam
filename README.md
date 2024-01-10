# Ruby on Rails MAS-RAD 2023 Exam

## Getting started

1. Install [Docker](https://www.docker.com/products/docker-desktop/) (and [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) on Windows). Then copy'n'paste into your terminal.

```bash
docker volume create ruby-bundle-cache
```

2. Add the following alias to your shell configuration file (e.g. `~/.bashrc` or `~/.zshrc`), then reload your terminal.

```bash
alias docked='docker run --rm -it -v ${PWD}:/rails -v ruby-bundle-cache:/bundle -p 3000:3000 ghcr.io/mas-rad/rails-cli-firefox-esr:latest'
```

3. Download the Rails Exam app from the [github.com/mas-rad/rails-2023-exam](https://github.com/mas-rad/rails-2023-exam) repository by clicking on the green "Code" button and selecting "Download ZIP". Unzip the archive in your working directory.

4. From within the repository folder, run the following commands:

```bash
docked bundle
docked rails db:setup
docked rails db:fixtures:load
```

5. You are ready! 🎉 Run `docked rails server` and check http://0.0.0.0:3000.


## Instructions

1. Modify the Rails application code to fix the 11 failing tests, running `docked rails test:all` should then be all green. The tests code cannot be modified!
2. When you are done, save all your changes, then create a ZIP file of your whole Rails application folder.
3. Generate a 12 characters secret hash with `docked rails secret | cut -c1-12` and append it to the ZIP file name (e.g. `rails-2023-exam-1234567890ab.zip`).
5. Sent me the ZIP file to: [thibaud@thibaud.gg](mailto:thibaud@thibaud.gg).


## Useful commands

- Launch Rails Dev Console: `docked rails console`
- List all products routes: `docked rails routes -g products`
- Run all tests: `docked rails test:all`


## Grading

Each test is worth 3 points, there's also 3 extra points for the code quality/style, for a total of 36 points.

The grading scale is as follows: [PDF](https://github.com/mas-rad/rails-2023-exam/blob/main/grading.pdf) ([bareme.ch](https://bareme.ch/tableau.php?id=3507589)).

## Author

[Thibaud Guillaume-Gentil](https://thibaud.gg) ([@thibaudgg](https://github.com/thibaudgg))
