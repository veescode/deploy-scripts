#!/bin/bash

git init
git config receive.denyCurrentBranch ignore

echo "Creating post-receive and make it executable"
echo ""
touch .git/hooks/post-receive
chmod +x .git/hooks/post-receive

echo "Writting commands to post-receive"
ls -la .git/hooks 

cat > .git/hooks/post-receive << EOL
#!/bin/bash
test "\${PWD%/.git}" != "\$PWD" && cd ..
unset GIT_DIR GIT_WORK_TREE

git reset --hard
EOL

echo ""
echo "Post-receive output: "
cat .git/hooks/post-receive
echo ""
