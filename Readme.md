# This repository is a blockchain

This repo contains a post-commit hook that probabalistically accepts only 1 out of every 4,096 commits,
based on whether the commit's hash starts with 3 zeros.

This is the same principle that Bitcoin is based on.

When you're ready to add a commit to this repository, run this helper script:

```sh
cp post-commit .git/hooks/
commit_message="<Your commit message>"

git commit -m "$commit_message"
while [ $? -ne 1 ]; do
    git commit -m "$commit_message" -m "Lucky Number: $(date '+%N')"
done
```

The output of this script should look something like:

![](img/Screenshot%20from%202022-07-04%2023-12-25.png)
