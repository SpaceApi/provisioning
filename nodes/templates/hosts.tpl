all:
  children:
    node1:
      hosts:
        node1.${domain}:
          ansible_host: "${node1_ipv4}"
