curl -s get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install groovy
sdk install gradle 4.2

sudo apt-get -y install postgresql postgresql-contrib phppgadmin postgresql-client apache2