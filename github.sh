ssh-keygen -t rsa -C "karthi.email@gmail.com"
cat ~/.ssh/id_rsa.pub

ssh -T git@github.com
