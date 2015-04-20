all: clean compile

clean:
	@rm -rf ebin/*.beam

compile:
	@test -d ebin || mkdir ebin
	@erl -make

test: clean compile
	@escript test.escript

#Docker targets
dbuild: docker/Dockerfile.template
	cd docker; ./build $(if $(nocache),nocache)

dcibuild:
	cd docker; ./run "./script/cibuild"

dtest:
	cd docker; ./run_test "make test"

dclean:
	cd docker; ./run "make clean"

drun:
	cd docker; ./run "make run"


