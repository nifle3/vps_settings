# How to start
```
nix develop -c ansible-playbook -i ./inventory.ini playbook.yml --ask-become-pass
```

# TODO:
- сделать автоматический перезапуск ssh
- сделать заблокирование всех остальных портов
- сделать через плейбук изначального пользователя
- сделать тоже самое на nix
