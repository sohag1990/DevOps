# Hola :-)

# https://github.com
# https://bitbucket.org


###Git commands

git init
git add . # .(dot) is denoted by current directory
git config --global user.email "me@domain.com" # specify --global to use git globaly on your machine.
git commit -m "change message"
git remote add origin git@github.com:sohag1990/DevOps.git #ssh remote
git remote add origin https://github.com/sohag1990/DevOps.git #https remote
git pull origin master # to pull from remote
git pull origin master --allow-unrelated-histories #to pull from unrelated history. To fix the fatel error of unrelated histories
git push origin master

#To remove a origin
git remote rm origin

git tag # to show all release versions
git tag -a v0.1 -m "inital version" # to release a version of your git porject
git push origin --tags # to push all tags/release to remote origi
git branch # to show available branches
git branch "branchName" # to create a new branch
git branch "DevOps-Beta" # this command create a new branch name "DevOps-Beta"
git checkout BranchName # to Switch another branch
git checkout DevOps-Beta # this command Switched me to branch 'DevOps-Beta'
git push origin DevOps-Beta # this command i pushed to the 'DevOps-Beta' Banch
git checkout master # this command Switched me to branch 'master' . Master is my main branch
git checkout --track -b DevOps-Stable # this command create new branch "DevOps-Stable" and Switched me to the new branch "DevOps-Stable"
git pull origin DevOps-Beta # this command pull request to DevOps-Beta to master
git merge fixes enhancements # to git marge

#to get more github commands install hub
sudo snap install hub

#To create remote repository
hub create repositoryName
