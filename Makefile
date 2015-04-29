
BEAMS := $(patsubst src/%.erl,ebin/%.beam,$(wildcard src/*.erl))

default: $(BEAMS) pip.img
	railing image

ebin/%.beam: src/%.erl
	erlc -o ebin $<

