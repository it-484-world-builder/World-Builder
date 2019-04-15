# Welcome to World Builder
## How to run World Builder using Cloud9
1. Create a new Ruby Cloud9 environment using the following url in the 'Clone from Git or Mercurial URL' field<br/>
```https://github.com/it-484-world-builder/World-Builder```
2. Change directory to the world-builder folder<br/>
```cd world-builder```
3. Install the required gems<br/>
```bundle install --without production```
4. Apply migrations<br/>
```rake db:migrate```
5. Seed the database<br/>
```rake db:seed```
6. Start the application<br/>
```rails server -p $PORT -b $IP```