build:
	@cargo build

clean:
	@cargo clean

TESTS = ""
test:
	@cargo test $(TESTS) --offline -- --color=always --test-threads=1 --nocapture

mongostart:
	@sudo docker run -d -p 27017:27017 -v `pwd`/data/db:/data/db --name bookydb mongo

mongostop:
	@sudo docker stop bookydb && sudo docker rm bookydb

docs: build
	@cargo doc --no-deps

style-check:
	@rustup component add rustfmt 2> /dev/null
	cargo fmt --all -- --check

lint:
	@rustup component add clippy 2> /dev/null
	touch src/**
	cargo clippy --all-targets --all-features -- -D warnings

dev:
	@cargo run

.PHONY: build test docs style-check lint
