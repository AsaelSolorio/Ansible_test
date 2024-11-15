#Makefile

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
		
format:
	black src/*.py tests/*.py
	
lint:
	pylint --disable=R,C,unused-argument src/*.py tests/*.py

test:
	pytest -vv tests/

security:
	bandit -r src/ 

all: install lint test security
