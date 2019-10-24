function smtp-server
  docker run --name=smtp -it -p 25:25 --rm namshi/smtp bash
end
