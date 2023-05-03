# Install prereq for venv
sudo apt -y install python3.8-venv
# Install venv
python3 -m venv venv

# https://pythonspeed.com/articles/activate-virtualenv-dockerfile/
export VIRTUAL_ENV=./venv
export PATH="$VIRTUAL_ENV/bin:$PATH"

# Adding prev to bashrc
# https://unix.stackexchange.com/questions/21598/how-do-i-set-a-user-environment-variable-permanently-not-session
echo "export VIRTUAL_ENV=./venv" >> ${HOME}/.bash_profile
echo 'export PATH="$VIRTUAL_ENV/bin:$PATH"' >> ${HOME}/.bash_profile

# Local Testing
echo 'export LINK=http://127.0.0.1:5000/sensor-data' >> ${HOME}/.bash_profile

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Stuff for tesseract
sudo apt-get install poppler-utils -yy
sudo apt-get install libleptonica-dev tesseract-ocr libtesseract-dev python3-pil tesseract-ocr-eng tesseract-ocr-deu tesseract-ocr-script-latn -yy

# Add dependencies
source "$SCRIPT_DIR"/venv/bin/activate
python src/setup.py develop
pip3 install -r requirements.txt

# Install Git Autocompletion
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash --insecure
str="if [ -f ~/.git-completion.bash ] ; then . ~/.git-completion.bash ; fi"
echo $str >> ~/.bashrc