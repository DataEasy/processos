Como contribuir
===============

## Modelagem

Para modelar, use o editor yEd - http://www.yworks.com/en/products/yfiles/yed

## Convenções de diretórios

Para subprocessos, coloque os arquivos `.graphml` e `.svg` dos mesmos num subdiretório chamado `subprocessos`. Veja uma modelagem pré-existente como exemplo.

## Exportando os SVGs

Após exportar os SVGs, é necessário executar o script [`update-uris.sh`](./update-uris.sh) para normalizar os arquivos.
Isso é necessário pois o yEd salva os caminhos absolutos ao linkar diagramas entre si, então é necessário relativizar tais caminhos. Vide o código fonto de tal script para mais detalhes.
