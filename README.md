# sapling setup guide

## repo-refactor

1. First you need to give sapling access to an ssh key that has access to your github account. You have two options: 

    1. First, you can add an ssh key to sapling. If you've followed the [sapling-guide](https://github.com/StanfordLegion/sapling-guide) for legion you'll have already done this. If not, on sapling run 
       ```
       $ ssh-keygen -t ed25519  
       ... (either choose a password or enter an empty one)
       ```
       Once your key has been created, you can get your public key by running 
       ```
       $ cat ~/.ssh/id_ed25519.pub
       ```
       which you can add to your GitHub account by following the instructions [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account#adding-a-new-ssh-key-to-your-account).

    2. Alternatively, you can give sapling access to your local ssh key. To do so, you'll need to spin up an `ssh-agent` on your local machine, and then configure ssh access to share the `ssh-agent` through your ssh connections to sapling. More concretely, on your local machine run
    ```
    eval $(ssh-agent)
    ssh-add
    ```
    and type in your ssh password if prompted. This spins up a background process for managing your ssh key. 
    Now you need to share that agent across your ssh connection, which we can do by modifying the `~/.ssh/config` file on your local machine. You'll need to append the following lines to that file:
    ```
    Host sapling.stanford.edu
      ForwardAgent yes
    ```
    Note that you'll need to restart any existing ssh connections. 

2. If you did the previous step correctly, when you run `ssh -T git@github.com` on sapling you should see something to the effect of
```
$ ssh -T git@github.com
Hi <your-github-id>! You've successfully authenticated, but GitHub does not provide shell access.
```

Now we'll actually get the repostory set up. To do so, perform the following
```
$ curl 'https://raw.githubusercontent.com/flexflow/sapling-guide/master/repo-refactor.sh' -o repo-refactor.sh
...
$ chmod u+x ./repo-refactor.sh
...
$ ./repo-refactor.sh
...
$ source ~/.bashrc
...
$ cd "$HOME/ff"
...
$ nix develop --accept-flake-config
... (this will take a while the first time) ...
$ ffpr 622 repo-refactor
```
Here you should see a interactive prompt for information related to GitHub. 
1. Select "GitHub.com"
2. Select "SSH"
3. Select "Yes"
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
$ nix develop --accept-flake-config
... (this will take a while the first time) ...
$ proj cmake
...
$ proj test
... (you should see a test run and pass here. if that is not the case contact @lockshaw)
```

## inference

TODO
