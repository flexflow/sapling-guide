# sapling setup guide

## repo-refactor

```
$ curl 'https://raw.githubusercontent.com/flexflow/sapling-guide/master/repo-refactor.sh' | bash
...
$ source ~/.bashrc
...
$ cd "$HOME/ff"
...
$ nix develop
... (this will take a while the first time) ...
$ ffpr 622 repo-refactor
```
Here you should see a interactive prompt for information related to GitHub. 
1. Select "GitHub.com"
2. Select "SSH"
3. Select "Yes"
4. Enter a passphrase for your ssh key if you would like
5. Enter a title for your ssh key ("sapling" would be a good choice)
4. Select "Paste an authentication token"
5. Now go to <https://github.com/settings/tokens> and click "Generate new token" in the top right-hand corner, in the dropdown that appears select "Generate new token (classic)"
6. You should see a text field called "Note". Enter the name "sapling" (this is just a note to yourself about what this key is for)
7. Under "Expiration" select "90 days"
8. Under "Select scopes" check the following check boxes: `repo`, `read:org`, and `admin:public_key`
9. Click "Generate token"
10. You should now see a key beginning with `ghp_`. Copy this, save it somewhere to your computer safe (if you lose it, github won't show it to you again)
11. Copy the key beginning with `ghp_` into the prompt "Paste your authentication token:" and hit enter.
12. You should now see a message that says "Logged in as \<your github username\>", followed by a bunch of output from git as it clones the FlexFlow repository. Once that's done continue with the instructions below:
```
$ cd repo-refactor
...
$ proj cmake
...
$ proj test
... (you should see a test run and pass here. if that is not the case contact @lockshaw)
```
Note that currently instead of a test run you see a linker error. We're working on this and should have a fix pushed soon. 

## inference

TODO
