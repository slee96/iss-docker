FROM django:latest


RUN pip install --upgrade pip; \
	apt update; \
	apt-get install -y make zip wget libpq-dev python-dev; \ 
	wget https://github.com/issessions/issessionsctf/archive/master.zip; \
	unzip master.zip -d /opt/app; \ 
	mv /opt/app/issessionsctf-master /opt/app/issessionsctf; 

RUN 	QUOTE=\'; sed -i '/INSTALLED_APPS/i \ 
		\\nSECRET_KEY = '$QUOTE'2^f+3@v7$v1f8yt0!se3-1t$5tlp+xm17=*gno_xoi&&9m#2a&'$QUOTE' \
		\nDEBUG = True \
		\nALLOWED_HOSTS = [] \
		\n \
		\nDATABASES = { \
    			\n'$QUOTE'default'$QUOTE': { \
		        \n'$QUOTE'ENGINE'$QUOTE': '$QUOTE'django.db.backends.postgresql_psycopg2'$QUOTE', \
        		\n'$QUOTE'NAME'$QUOTE': '$QUOTE'iss'$QUOTE', \ 
		        \n'$QUOTE'USER'$QUOTE': '$QUOTE'issessions'$QUOTE', \
		        \n'$QUOTE'PASSWORD'$QUOTE': '$QUOTE'issessions'$QUOTE', \
		        \n'$QUOTE'HOST'$QUOTE': '$QUOTE'postgresql'$QUOTE', \
		        \n'$QUOTE'PORT'$QUOTE': '$QUOTE'5432'$QUOTE', \
		    \n} \
		\n}' /opt/app/issessionsctf/issessionsctf/settings/__init__.py;
       
#Install Python 3.6.1 and upgrade pip3
RUN cd /opt; \
	wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz; \
	tar xvf Python-3.6.1.tgz; \
	rm -f Python-3.6.1.tgz; \
	cd Python-3.6.1; \
	./configure --with-lto; \
	make -j8; \
	make EXTRATESTOPTS=--list-tests install; \
	rm -f /usr/local/python3; \
	ln -s /usr/local/bin/python3.6 /usr/local/python3; \
	pip3 install --upgrade pip;

RUN pip3 install -r /opt/app/issessionsctf/requirements.txt; \
	pip3 install django psycopg2; \
	apt update;

WORKDIR /opt/app/issessionsctf
#VOLUME ["/opt/app/issessionsctf"]
#ADD . /opt/app/issessionsctf

COPY wait_for_it.sh /home/

CMD ["/bin/bash", "-c", "bash /home/./wait_for_it.sh && python3 manage.py makemigrations ctf && python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000"]
