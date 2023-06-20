## 運行指令

### 驗證inventories -> hosts.yaml
```bash
cd k8s-simple
ansible-inventory -i inventory/k8s.yaml --list
```

### ping指定的group機器, 從hosts找
```bash
cd k8s-simple
ansible k8s -m ping -i inventory/k8s.yaml
ansible controlplane -m ping -i inventory/k8s.yaml
ansible master -m ping -i inventory/k8s.yaml
```

### 編寫playbook.yaml, 執行使用playbook.yaml跑ansible
```bash
ansible-playbook -i inventory/k8s.yaml playbook.yaml
```

### 運行替換etcd-config.yaml裡的URLs的腳本
```bash
# 要替換的檔案
cat k8s-simple/roles/common/files/etcd-config.yaml
cd k8s-simple
ansible-playbook -v -e "host_name=localhost" --extra-vars "etcd_urls=http://test01.com:2379,http://test02.com:2379,http://test03.com:2379" site.yaml
```

