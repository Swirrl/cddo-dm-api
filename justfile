run:
	poetry run uvicorn src.main:app --reload

fuseki-docker:
  docker compose up --build -d

setup-hooks:
  poetry run pre-commit install
  poetry run pre-commit run --all-files

dev-deps:
  ./localdb/install.sh

start-db:
  (cd localdb && ./fuseki/fuseki-server --config=fuseki-config.ttl)

generate-spec-file:
  curl localhost:8000/openapi.json | yq eval -P > openapi.yaml