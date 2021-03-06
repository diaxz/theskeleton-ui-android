mkdir $HOME/buildApk/ 
cp -R app/build/outputs/apk/app-dev-debug.apk $HOME/buildApk/

cd $HOME
git config --global user.email "theskeleton@codenergic.org"
git config --global user.name "TheSkeleton"

git clone --quiet --branch=master https://diaxz:$GITHUB_API@github.com/diaxz/theskeleton-ui-android master > /dev/null

cd master
cp -Rf $HOME/buildApk/* .

git add -f .
git remote rm origin
git remote add origin https://diaxz:$GITHUB_API@github.com/diaxz/theskeleton-ui-android.git
git add -f .
git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed [skip ci] "
git push -fq origin master > /dev/null
echo -e "Done\n"
