# Migrations Copier

Often when doing deployments of huge features, Database is migrated first with the incoming changes. This is give an idea about what could possible break in the existing features.


### How to run:
  - Copy the bash script to the root of your rails project
  ```sh
  ./migrations-copier.sh
  ```
  - Set execution permissions to file if its not executing

  - Give your feature branch where you have the new migration files
  - Give your release branch where are you are going to deploy the feature

  - This will compare your feature branch with the release branch and get all new migrations and copy it to a new branch, clonned from the release branch.

  - You have to add and commit the migration files that has been moved (view them by 'git status')

