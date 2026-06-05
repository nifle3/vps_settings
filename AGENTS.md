# Repository Guidelines

## Project Structure & Module Organization
This repository is an Ansible-based server configuration repo.

- `playbooks/` contains entry points such as `playbooks/playbook.yml` and `playbooks/web_playbook.yml`.
- `roles/` holds reusable roles. Each role follows standard Ansible layout: `tasks/`, `defaults/`, `handlers/`, `templates/`, `files/`, and `meta/`.
- `inventory.ini.example` and `vars.yml.example` are templates; copy them to local files before running playbooks.
- `ansible.cfg` sets `roles_path = roles` and uses `inventory.ini` by default.

## Build, Test, and Development Commands
Use either Nix or a Python virtual environment.

- `nix develop` opens a dev shell with Ansible, Git, and Python 3.
- `nix develop -c ansible-playbook -i ./inventory.ini playbooks/playbook.yml --ask-become-pass` runs the main playbook from the Nix shell.
- `python3 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt` sets up a local Python environment.
- `ansible-playbook -i ./inventory.ini playbooks/playbook.yml --ask-become-pass` runs the main playbook without Nix.
- `ansible-playbook --syntax-check -i ./inventory.ini playbooks/playbook.yml` is the fastest validation step before applying changes.

## Coding Style & Naming Conventions
Follow standard Ansible YAML conventions:

- Use 2-space indentation in YAML.
- Prefer lowercase, descriptive file names such as `main.yml`, `nginx.conf.j2`, and `weekly_apt_update.sh`.
- Keep task names short and action-oriented, for example `Install nginx` or `Disable root login`.
- Use Jinja2 templates for config files that need host-specific variables; keep static files in `files/`.

## Testing Guidelines
There is no dedicated automated test suite in the repo. Validate changes with:

- `ansible-playbook --syntax-check` for parsing and role resolution.
- `ansible-playbook --check --diff` when the target host and tasks support dry runs.
- A controlled run against a non-production host before applying broad infrastructure changes.

## Commit & Pull Request Guidelines
Git history uses short, informal commit messages such as `update README.md`, `add requirements.txt`, and `fix inventory.ini.example`. Keep commits similarly concise and focused.

Pull requests should include:

- A short summary of the infrastructure change.
- The playbook or role affected.
- Any manual validation performed.
- Notes about required inventory or variable updates.

## Security & Configuration Tips
Do not commit real credentials, inventory files, or host-specific secrets. Keep local copies of `inventory.ini` and `vars.yml` outside versioned examples.
