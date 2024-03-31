# This repository is a blockchain

This repo contains a post-commit hook that rejects commits if their hashes do not start with 3 zeros. This is the same principle that Bitcoin is based on, which is to say that artificial scarcity is the dumbest shit ever.

When you're ready to add a commit to this repository, run this helper script:

```sh
commit_message="<Your commit message>"

git commit -m "$commit_message"
while [ $? -ne 1 ]; do
    git commit -m "$commit_message" -m "Lucky Number: $(date '+%N')"
done
```
