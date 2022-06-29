alias python "python3"
alias pip "pip3"
alias wd "wiwdata"
alias jn "jupyter notebook"
alias nb "wd apex notebook"

function up
  wd apex crash
  python3 ~/Git/scripts/bingpot.py
  wd apex remote "kc5010"
  nb
end

function react-new
  npx create-react-app $argv --template typescript;
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function encrypt
  openssl enc -aes-256-cbc -salt -in secrets.txt -out secrets.enc
end

function decrypt
  openssl enc -d -aes-256-cbc -in secrets.enc -out secrets.txt
end

function publish
  wiwdata binder --profile dedevel publish $argv.cauldron
end

