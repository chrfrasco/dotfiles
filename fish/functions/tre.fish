function tre
  tree -aC -I '.git|node_modules' --dirsfirst $argv | less -FRNX
end

