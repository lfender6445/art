ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

now := $(shell date)

# tab validation
# /bin/cat -e -t -v Makefile

download:
	echo "$(now) - download" >> $(ROOT_DIR)/tmp/log.txt; \
	wget -O ./data/amex.csv 'https://old.nasdaq.com/screening/companies-by-name.aspx?letter=0&exchange=amex.csv&render=download'; \
	wget -O ./data/nyse.csv 'https://old.nasdaq.com/screening/companies-by-name.aspx?letter=0&exchange=nyse&render=download' ; \
	wget -O ./data/nasdaq.csv 'https://old.nasdaq.com/screening/companies-by-name.aspx?letter=0&exchange=nasdaq&render=download'

build:
	cd "$(ROOT_DIR)"; \
	echo "$(now) - build" >> $(ROOT_DIR)/tmp/log.txt; \
	which jupytext >> $(ROOT_DIR)/tmp/log.txt; \
	jupytext --to notebook notebook.py && \
	jupyter nbconvert --output-dir=tmp --execute notebook.ipynb

deploy:
	cd "$(ROOT_DIR)" && \
	echo "$(now) - deploy" >> $(ROOT_DIR)/tmp/log.txt && \
	python3 make_worker.py && \
	wrangler publish

all: build deploy
