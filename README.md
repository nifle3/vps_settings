# How to start
## If you have nix package manager
```
nix develop -c ansible-playbook -i ./inventory.ini playbook.yml --ask-become-pass
```

## If you have no nix package manager
```
# first step create a venv
python3 -m venv ./.venv
# Second step activate venv
fish ./.venv/bin/activate.fish # or something else
# Install deps
pip install -r requirements.txt
# Start 
ansible-playbook -i ./inventory.ini ./playbooks/playbook.yml --ask-become-pass
```

# TODO:
- сделать автоматический перезапуск ssh
- сделать заблокирование всех остальных портов
- сделать через плейбук изначального пользователя
- сделать тоже самое на nix
