#Only Used in this file
LOCAL_ORG = esp-open-sdk
GCR_PROJECT = esp-open-sdk
GCR_HOST = eu.gcr.io

#Tags for images:
LOCALTAG = $(LOCAL_ORG)/$(IMAGE):$(VERSION)
REMOTETAG = $(GCR_HOST)/$(GCR_PROJECT)/$(IMAGE):$(VERSION)

#Name for running container:
NAME = $(LOCAL_ORG)-$(IMAGE)

.PHONY: build push gcloudpush shell run start stop rm release default

build: dir
	#these eval statements make the dockerfile dynamic, see http://docteurklein.github.io/2015/01/11/docker-auto-builds-and-me/
	#making $(LOCALTAG)
	eval $$(cat  ../build.eval/*)	&& eval "echo \"$$(<Dockerfile)\"" 2> /dev/null | docker build -t $(LOCALTAG) -
	docker tag $(LOCALTAG) $(REMOTETAG)
	echo "$(IMAGE)=$(LOCALTAG)" > ../build.eval/$(IMAGE)

dir:
	mkdir -p ../build.eval/

push:
	docker push $(LOCALTAG)

gcloudpush:
	gcloud docker -- push $(REMOTETAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $() $(ENV) $(LOCALTAG) /bin/bash

run:
	docker run --rm --device=/dev/ttyUSB0 --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) -it $(LOCALTAG)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(LOCALTAG)

stop:
	docker stop $(NAME)

rm:
	docker rm $(NAME)

release: build
	make push -e VERSION=$(VERSION)

default: build
