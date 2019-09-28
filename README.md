# ISS Session CTF / dev-docker deployment

## Enviroment requirements:
  - Linux OS/Linux VM
  - docker-ce (installation varries per distribution)
  - docker-compose  
  - git ( $ apt install git) 

## Initial deployment steps:
  ### STEP 1: 
    create a working directory for your project
    $ mkdir ~/iss_sessions_dev

  ### STEP 2:
    pull this repo
    $ git clone https://github.com/slee96/iss-docker.git

  ### STEP 3:
    change working directory
    $ cd iss-docker/

  ### STEP 4:
    run project 
    $ docker-compose up -d

  ### Final:
    Check if the application has deployed
    http://localhost:8000/

## Dynamic development deployment
  ### STEP 1:
    In you're project directory, run: 
    $ wget https://github.com/issessions/issessionsctf/archive/master.zip; unzip master.zip; rm -f master.zip

  ### STEP 2:
    Edit the docker-compose.yml file with your prefered editor (nano, vim, vi, pico)
    $ vi docker-compose.yml

  ### STEP 3:
    Uncomment the following lines
    #    volumes:
    #    - ./issessionsctf-master:/opt/app/issessionsctf

  ### STEP 4
    Redeploy the containers with with the mounted volume
    $ docker-compose up -d --force-recreate

  ### Final:
    Modify the css test dynamic deployment  
    $ sed -i 's/font-size: 1em;/font-size: 3em;/g' issessionsctf-master/ctf/static/ctf/css/main.css 

    Check if the application has deployed with large font
    http://localhost:8000/

    Revert chnages
    $ sed -i 's/font-size: 3em;/font-size: 1em;/g' issessionsctf-master/ctf/static/ctf/css/main.css
