#!/bin/bash
# usage build_staging.sh $IMAGE_NAME $REPO $STAGING_IMAGE_NAME $DB_HOST $DB_NAME $DB_PASSWORD $DB_USERNAME

# Exit early.
set -e

# Install dependencies and build all packages
yarn

# CI
yarn lint
yarn test
yarn build

# Create docker image
docker build -t ==CHANGE ME== .

DOCKID=$(docker images $1 -q)
VERSION=$(git log -1 --format=%h)

PACKAGE_URL_PROD="docker.pkg.github.com/bain/$2/$1:$VERSION"

docker tag $DOCKID $PACKAGE_URL_PROD
docker push $PACKAGE_URL_PROD

echo "URL: ${PACKAGE_URL_PROD}"
