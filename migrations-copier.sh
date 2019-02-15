# alanjsph@live.com
# github: @alanjsph

echo "Copy just your migration files from a feature branch to release branch"
read -p "Enter your feature branch's name : " feature_branch
read -p "Enter your release branch's name : " release_branch

# checkout out to the feature branch
git checkout "$feature_branch" > /dev/null

# create a temporary directory
rm -rf migrations-to-move > /dev/null
mkdir migrations-to-move > /dev/null

# move all changed migration files
(IFS='
'
for x in `git diff --name-only "$release_branch" "$feature_branch" db/migrate`; do `cp "$x" "migrations-to-move"` ; done)

# checkout out to the release branch
git checkout "$release_branch" > /dev/null

# create a new branch
git checkout -b "$feature_branch"-only-migrations > /dev/null

cp -R migrations-to-move/. db/migrate/ > /dev/null

rm -rf migrations-to-move > /dev/null
