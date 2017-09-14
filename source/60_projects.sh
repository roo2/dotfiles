#!/bin/bash
export ALETHEIA_APP_DIR=/home/roo2/projects/aletheia/aletheia-app
alias aletheia="tab 'pushd /home/roo2/projects/aletheia/aletheia-app && ./scripts/ipfs-local.sh' && tab 'pushd /home/roo2/projects/aletheia/aletheia-app && ./node_modules/.bin/embark blockchain'"

toastSign() {
  gpg --default-key toastfacts@example.com -o $1.gpg --clearsign  $1
  cat $1.gpg
}

tab() {
  gnome-terminal -x bash -c "$1; bash"
}
# tab() {
#   echo $1 $2
#   gnome-terminal --tab --working-directory '$1' -e 'bash -c \"$2; exec bash\"'
# }
