EX_SOURCES:=$(shell find lib -name '*.ex')

deps: mix.exs
	mix deps.get

.PHONY: build
build: $(EX_SOURCES) deps
	mix compile

exgit: build
	mix escript.build

.PHONY: credo
credo: deps
	mix credo --strict

.PHONY: test
test:
	mix test --cover
