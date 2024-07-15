EXE := _build/default/bin/x
LIB := priv/crates/x_nif/x_nif.so

.PHONY: all
all: rebuild
	$(MAKE) -s check test

.PHONY: build
build: $(EXE)

.PHONY: rebuild
rebuild: clean
	$(MAKE) build

.PHONY: run
run: $(EXE)
	@./$(EXE)

$(EXE): $(LIB) src/*.erl
	rebar3 escriptize

$(LIB): src-rs/x_nif/src/*.rs src-rs/x_nif/Cargo.toml
	rebar3 compile

.PHONY: check
check:
	rebar3 do dialyzer, xref

.PHONY: test
test:
	rebar3 eunit
	cargo test

.PHONY: clean
clean:
	rebar3 clean
