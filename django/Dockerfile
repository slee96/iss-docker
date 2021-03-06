FROM django:latest

# Update system and install packages to assist with image build 
RUN apt-get update; \
	apt-get install -y make zip wget; \ 
	wget https://github.com/issessions/issessionsctf/archive/master.zip; \
	unzip master.zip -d /opt/app; \ 
	mv /opt/app/issessionsctf-master /opt/app/issessionsctf; 

# Add required enviromental variables to django's project settings
RUN QUOTE=\'; sed -i '/INSTALLED_APPS/i \ 
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
       
# Upgrade pip3 and manually install newer version of python: Python 3.6.1
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

# Install issessionctf project requirements, and install psycopg2 django plugin for postgresql database
RUN pip3 install -r /opt/app/issessionsctf/requirements.txt; \
	pip3 install django psycopg2; \
	apt-get update;

# Set working directory of image
WORKDIR /opt/app/issessionsctf

# Copy script to image
COPY django.sh /home/

# Give execute permissions for scripts
RUN chmod +x /home/*.sh

# Executes wait_for_it script, creates tables in postgres database, and deploys ctf webapp
CMD ["/bin/bash", "-c", "bash /home/./django.sh"]
