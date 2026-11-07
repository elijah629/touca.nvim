# touca.nvim

> based neovim config for the — never mind, fuck this shit just use my config.

# Automated updates

GitHub Actions updates flake inputs every Wednesday at 08:47 UTC, runs the
Nixvim flake checks and builds the default package on x86_64 Linux, then commits
successful updates to the default branch. Unchanged inputs produce no commit.
The workflow can also be started from **Actions → Update flake → Run workflow**.

The built-in `GITHUB_TOKEN` needs permission to push to the default branch;
the workflow declares `contents: write`. No additional secrets are required.
Consuming system flakes must update their own lockfiles to adopt new revisions.
