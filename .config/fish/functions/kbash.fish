function kbash
  # $1 -> container_id
  command kubectl exec -it "$argv[1]" bash
end
