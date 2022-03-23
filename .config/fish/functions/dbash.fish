function dbash
  # $1 -> container_id
  command docker exec -it "$argv[1]" bash
end
