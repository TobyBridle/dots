function fnvim --wraps='fd --exclude .git | fzf | xargs nvim' --wraps='fd --exclude .git -t f | fzf | xargs nvim' --description 'alias fnvim fd --exclude .git -t f | fzf | xargs nvim'
  fd --exclude .git -t f | fzf | xargs nvim $argv; 
end
