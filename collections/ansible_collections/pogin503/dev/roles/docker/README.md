docker
======

Requirements
------------

Role Variables
--------------

Example Playbook
----------------

```
    - hosts: servers
      roles:
         - { role: username.docker, x: 42 }
```

```
ansible-playbook -i docker/tests/inventory docker/tests/test.yml
```

Usage
-----

License
-------

MIT
