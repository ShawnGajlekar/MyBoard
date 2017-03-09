root = "/opt/www/2.NoticeBoard_chat/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.2.NoticeBoard_chat.sock"
worker processes 1
timeout 30
