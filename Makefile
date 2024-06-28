# Variables
HUGO_CMD = hugo
DIST_DIR = u2_tarea0/dist
POST_DIR = content/post
THEME = ananke

# Reglas
.PHONY: build clean post help

build: ## Genera el sitio web a partir de los archivos de configuración y markdown.
	@echo "Generando el sitio web..."
	$(HUGO_CMD) -d $(DIST_DIR)

clean: ## Limpia el contenido del directorio dist/.
	@echo "Limpiando el contenido del directorio dist..."
	rm -rf $(DIST_DIR)

post: ## Crea una nueva entrada de blog.
	@echo "Creando una nueva entrada de blog..."
ifndef POST_TITLE
	$(error POST_TITLE no está definido)
endif
ifndef POST_NAME
	$(error POST_NAME no está definido)
endif
	@echo "---\ntitle: \"$(POST_TITLE)\"\ndate: $(shell date +\"%Y-%m-%dT%H:%M:%S%z\")\ndraft: false\n---\n" > $(POST_DIR)/$(POST_NAME).md

help: ## Muestra la lista de objetivos y su uso.
	@echo "Objetivos disponibles:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

package:
    zip -r awesome-website.zip awesome-api dist/

clean:
    rm -f awesome-website.zip
