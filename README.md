## ansbile

資料夾結構

inventory: 存放機器資訊

playbooks: 定義任務流

roles: 定義任務

ansible.cfg: ansible的相關配置, 包含inventory, role路徑指定等等

### 驗證inventories -> hosts.yaml
```bash
# 檢查機器資訊配置正確
ansible-inventory --list
```

### 執行指令
```bash
ansible-playbook playbooks/tasks
```

### 任務列表
```bash
# ping
ansible-playbook -e "hosts_name=localhost" playbooks/ping.yaml

# etcd_url_change
ansible-playbook -e "hosts_name=localhost" --extra-vars "etcd_urls=http://test01.com:2379,http://test02.com:2379,http://test03.com:2379" playbooks/etcd-url-change.yaml

# diff-file
ansible-playbook -e "hosts_name=localhost" playbooks/diff-file.yaml
```