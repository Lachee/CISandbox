
Write-Host "Deploying Docs to GitHub"
git config --global credential.helper store
Add-Content "$env:USERPROFILE.git-credentials" "https://$($env:access_token):x-oauth-basic@github.com`n"
git config --global user.name "Lachee"

git clone "https://github.com/Lachee/File-Search.git" docs

Add-Content "docs/build.cake" "AppVeyor-$($env:APPVEYOR_BUILD_NUMBER)" -Force

cd docs
git commit -a -m "AppVeyor-$($env:APPVEYOR_BUILD_NUMBER)";
git push -f origin master 
cd ..

Write-Host "Done"