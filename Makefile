IMG := www.actualists.net
PWD := $(shell pwd)
VOL := -v ${PWD}:/wiki

all:	build browser run
	@echo

build:
	docker build -t ${IMG} .

browser: macbrowser
	@echo

# Assuming we use boot2docker:
# FIXME: boot2docker only accepts port 80, not a custom port.
macbrowser:
	(sleep 1; open http://`echo ${DOCKER_HOST} | python -c "print raw_input().split('://')[1].split(':')[0]"`) &

run:
	docker run --rm -p 80:80 ${VOL} ${IMG}

runprod:	build
	docker rm -vf ${IMG}-run || true
	docker run -d --name=${IMG}-run ${VOL} ${IMG}
	docker logs -f ${IMG}-run

shell:
	docker run --rm -it ${IMG} sh

