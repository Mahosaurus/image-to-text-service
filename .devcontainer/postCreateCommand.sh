sudo python src/setup.py develop
pip3 install -r requirements.txt
pip3 install -r requirements.dev

# Install Git Autocompletion
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash --insecure
str="if [ -f ~/.git-completion.bash ] ; then . ~/.git-completion.bash ; fi"
echo $str >> ~/.bashrc
