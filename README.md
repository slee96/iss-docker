# ISS Session CTF / dev-docker deployment

## Enviroment requirements:
  - Linux OS/Linux VM
  - docker-ce (installation varries per distribution)
  - docker-compose  
  - git ( $ apt install git) 

## Initial deployment steps:
  ### STEP 1: 
  Create a working directory for your project \
    **$** `mkdir ~/iss_sessions_dev`

  ### STEP 2:
  Pull this repo \
    **$** `git clone https://github.com/slee96/iss-docker.git`

  ### STEP 3:
  Change working directory \
  **$** `cd iss-docker/`

  ### STEP 4:
  Deploy the project \
  **$** `docker-compose up -d`

  ### Final:
  Check if the application has deployed \
  `http://localhost:8000/` 

## Dynamic development deployment
  ### STEP 1:
  In you're project directory, run: \
  **$** wget https://github.com/issessions/issessionsctf/archive/master.zip; unzip master.zip; rm -f master.zip 

  ### STEP 2:
  Edit the docker-compose.yml file with your prefered editor (nano, vim, vi) \
  **$** `vi docker-compose.yml`

  ### STEP 3:
  Uncomment the following lines \
    `#    volumes:
    #    - ./issessionsctf-master:/opt/app/issessionsctf`

  ### STEP 4:
  Add enviroment variables to django project settings \
  **$** `QUOTE=\'; sed -i '/INSTALLED_APPS/i \
    SECRET_KEY = '$QUOTE'2^f+3@v7$v1f8yt0!se3-1t$5tlp+xm17=*gno_xoi&&9m#2a&'$QUOTE' \
    DEBUG = True \
    ALLOWED_HOSTS = [] \
    \
    DATABASES = { \
      '$QUOTE'default'$QUOTE': { \
        '$QUOTE'ENGINE'$QUOTE': '$QUOTE'django.db.backends.postgresql_psycopg2'$QUOTE', \
        '$QUOTE'NAME'$QUOTE': '$QUOTE'iss'$QUOTE', \
        '$QUOTE'USER'$QUOTE': '$QUOTE'issessions'$QUOTE', \
        '$QUOTE'PASSWORD'$QUOTE': '$QUOTE'issessions'$QUOTE', \
        '$QUOTE'HOST'$QUOTE': '$QUOTE'postgresql'$QUOTE', \
        '$QUOTE'PORT'$QUOTE': '$QUOTE'5432'$QUOTE', \
      } \
    }' issessionsctf-master/issessionsctf/settings/__init__.py;`

  ### STEP 4
  Redeploy the containers with with the mounted volume \
  **$** `docker-compose up -d --force-recreate`

  ### Final:
  Modify the css test dynamic deployment  \
  **$** `sed -i 's/font-size: 1em;/font-size: 3em;/g' issessionsctf-master/ctf/static/ctf/css/main.css`

  Check if the application has deployed with large font \
  `http://localhost:8000/`

  Revert chnages \
  **$** `sed -i 's/font-size: 3em;/font-size: 1em;/g' issessionsctf-master/ctf/static/ctf/css/main.css`
