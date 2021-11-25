git pull;
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD);
GIT_TAG="deploy-${CURRENT_BRANCH}-$(date +%s)";echo "Deploy tag is: $GIT_TAG";
git tag $GIT_TAG;
git push origin $GIT_TAG;
echo "Tag pushed to GitHub; Please check https://travis-ci.com/ for your deploy status"'
