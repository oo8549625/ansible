## 運行指令

### 運行替換etcd-config.yaml裡的URLs
```bash
# 要替換的檔案
cat k8s-simple/roles/common/files/etcd-config.yaml

ansible-playbook -v -e "host_name=localhost" --extra-vars "etcd_urls=http://test01.com:2379,http://test02.com:2379,http://test03.com:2379"  k8s-simple/site.yml
```

