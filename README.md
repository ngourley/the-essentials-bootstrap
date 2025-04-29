# the-essentials-preflight

This script is designed to perform minimum bootstrapping
to ready MacOS device for configuration management via
Ansible.

Download script from repo:

``` shell
curl -L \
    --output the-essentials-bootstrap.zip \
    https://github.com/ngourley/the-essentials-bootstrap/archive/refs/heads/master.zip
```

Extract script:

```shell
# The zip will be extracted to a folder named
# 'the-essentials-bootstrap' within the current directory
unzip the-essentials-bootstrap.zip

# Switch to new directory
```shell
cd the-essentials-bootstrap
```

Make `bootstrap.sh` executable, if not already:

``` shell
chmod 755 bootstrap.sh 
```

Execute script:

```shell
./bootstrap.sh
```

Clone `the-essentials`

``` shell
# Will clone to a new sub-directory. You may also
# the name for the project directory.
# e.g. git clone https://github.com/ngourley/the-essentials.git custom-name
git clone https://github.com/ngourley/the-essentials.git
```

Manually install 1password

``` shell
brew install 1password
```

From this point forward, use the instructions
from the `the-essentials` README.md.
