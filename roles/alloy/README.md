alloy
=====

Requirements
------------

Role Variables
--------------
```yaml
alloy_dl_url: https://github.com/AlloyTools/org.alloytools.alloy/releases/download/v5.0.0.1/Alloy-5.0.0.1.jar
alloy_mac_dl_url: https://github.com/AlloyTools/org.alloytools.alloy/releases/download/v5.0.0.1/Alloy-5.0.0.1.pkg
alloy_path: ~/.local/share/alloy
alloy_file: Alloy-5.0.0.1.jar
```

Example Playbook
----------------

```
    - hosts: servers
      roles:
         - { role: alloy }
```

```
ansible-playbook -i alloy/tests/inventory alloy/tests/test.yml
```

Usage
-----

License
-------

MIT
