# tex-live

> Aprendendo LaTeX

## Instruções de uso

Instale e inicie o Docker Desktop na sua maquina. Crie uma conta no HUB do Docker.

Crie a imagem

```
./build-tex-live.sh
```

ou baixe do Docker HUB

```
docker login SEU_USUÁRIO # informe SUA_SENHA
docker pull parana/tex-live
```

Agora você pode ir para o diretório onde se encontra o seu projeto LaTeX e executar:

```bash
docker run -ti --rm -v $PWD/dippg_latex_template:/tex/data parana/tex-live bash
```

## Instalando LaTeX no Ubuntu 18.04 - algumas dicas.

```bash
apt-get update && \
    apt-get install -y curl wget xzdec sudo unzip vim nano apt-file

# Instalação Minimalista
apt-get install -y --no-install-recommends texlive

# ARG DEBIAN_FRONTEND=noninteractive
# Instalação recomendada
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get -y install texlive-latex-extra \
    texlive-extra-utils \
    texlive-science \
    texlive-bibtex-extra \
    texlive-fonts-extra \
    texlive-lang-portuguese \
    texlive-publishers

# Para usar o biber com back-end do Biblatex
apt-get -y install biber --fix-missing
```

O comando abaixo mostra se deu erro pela falta de algum pacote

```bash
texliveonfly main.tex  | grep "Error:" 
```

Como por exemplo, este abaixo:

```bash
! LaTeX Error: File `biblatex.sty' not found.
```

Neste caso, execute 

```bash
apt update && apt-file search /biblatex.sty 
```

O sistema responde com:

```bash
texlive-bibtex-extra: /usr/share/texlive/texmf-dist/tex/latex/biblatex/biblatex.sty
```

Ou seja, o arquivo `biblatex.sty` encontra-se no pacote `texlive-bibtex-extra`.

Então você pode instalar este pacote:

```bash
apt-get install -y texlive-bibtex-extra
```

Para gerar o PDF use:

```bash
pdflatex main.tex && bibtex main && pdflatex main.tex && pdflatex main.tex
```


Para gerar o PDF tendo o `biber` como back-end use:

```bash
pdflatex main.tex && biber main && pdflatex main.tex && pdflatex main.tex
```

Observe que é necessário intercalar a chamada ao `bibtex/biber` entre as chamadas do `pdflatex`.

Para limpar os temporários use:

```bash
rm -rf main.aux main.bcf main.loa main.lof main.log main.lol main.lot main.out main.run.xml main.synctex.gz main.toc main.bbl main.blg
```

Por ultimo abra o PDF no seu visualizador.

```bash
open main.pdf
```

## Resolução de Problemas

**Problema:**

Font OT1/pcr/m/n/10=pcrr7t at 10.0pt not loadable: Metric (TFM) file not found. \maketitle

**Solução:**

```bash
tlmgr search --file pcrr7t.tfm --global
```

```
tlmgr: package repository http://linorg.usp.br/CTAN/systems/texlive/tlnet (verified)
courier:
  texmf-dist/fonts/tfm/adobe/courier/pcrr7t.tfm
```

```bash
sudo tlmgr install courier
```

Repita para `phvr7t.tfm`

```bash
tlmgr search --file phvr7t.tfm --global
sudo tlmgr install helvetic
```

## Usando o pacote `texliveonfly`

```bash
texliveonfly artigo-1.tex
```

## Usando a Linguagem TeX

Veja os [videos do professor Aquino](https://youtu.be/F-yGTt9Bty4?list=PLa_2246N48_p9ndUHlO255uvKtSR8mshE) no YouTube

Abaixo um resumo.

#### Listas

![latex-listas](docs/latex-listas.png)

![lista-simples](docs/latex-lista-simples.png)

#### Operadores e frações

![operadores-e-fracoes](docs/latex-operadores-e-fracoes.png)

#### Potências e Raizes

![potencias e raizes](docs/latex-potencia.png)

#### Indices para enumerados

![indices](docs/latex-indices.png)

#### Teoria de Conjuntos

![conjuntos](docs/latex-conjuntos.png)

![conjuntos 1](docs/latex-conjuntos-1.png)

