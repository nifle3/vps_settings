# Title
- []

# How to start
## If you have nix package manager
```
nix develop -c ansible-galaxy collection install -r requirements.yml
nix develop -c ansible-playbook -i ./inventory.ini ./playbooks/playbook.yml --ask-become-pass
```

## If you have no nix package manager
```
# first step create a venv
python3 -m venv ./.venv
# Second step activate venv
source ./.venv/bin/activate.fish # or something else
# Install deps
pip install -r requirements.txt
# Install Ansible collections
ansible-galaxy collection install -r requirements.yml
# Start 
ansible-playbook -i ./inventory.ini ./playbooks/playbook.yml --ask-become-pass
```
