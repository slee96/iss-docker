###ISS Session CTF / dev-docker deployment

Enviroment requirements:
  - Liunx OS/Linux VM
  - docker-ce (installation varries per distribution)
  - docker-compose  
  - git ( $ apt install git) 

Initial deployment steps:
  STEP 1: 
    create a working directory for your project
    $ mkdir ~/iss_sessions_dev

  STEP 2:
    pull this repo
    $ git clone https://github.com/slee96/iss-docker.git

  STEP 3:
    change working directory
    $ cd iss-docker/

  STEP 4:
    run project 
    $ docker-compose up -d --build 

  Final:
    Check if the application has deployed
    http://localhost:8000/


