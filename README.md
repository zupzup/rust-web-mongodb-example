# rust-web-mongodb-example

An example using MongoDB in a Rust Web Service

## Run

```bash
make mongostart

make dev
```

Runs a local mongodb instance using Docker and an HTTP server on http://localhost:8080.

You can then use CRUD operations on the book resource like this:

Fetch all books:

```bash
curl http://localhost:8080/book
```

Create a new book:

```bash
curl -X POST http://localhost:8080/book -d '{"name": "good book", "author": "another", "num_pages": 500, "tags": ["fun"]}' -H "content-type: application/json"
```

Edit a book:

```bash
curl -X PUT http://localhost:8080/book/5f15fd5400b98edc001944c0 -d '{"name": "good book", "author": "another", "num_pages": 500, "tags": ["fun", "long"]}' -H "content-type: application/json"
```

Delete a new book:

```bash
curl -X DELETE http://localhost:8080/book/5f15fd3900789205001944bf
```
