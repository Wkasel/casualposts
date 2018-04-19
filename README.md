Casualposts
Installation Instructions
-------
To view locally, clone the repo, install and create the database.
```
git clone git@github.com/wkasel/casualposts.git
cd casualposts
bundle install
rake db:setup
```
If you don't have imagemagick on your computer, install it
```
mac - brew install imagemagick
```


One great option is to run Pow <http://pow.cx>, then you can have subdomains setup.
```
curl get.pow.cx | sh
cd ~/.pow
ln -s /path/to/casualposts
open casualposts.test
```
In order to view logs you want to:
```
tail -f log/development.log
```

By default if no subdomain is provided, the app defaults to SFBay Area
