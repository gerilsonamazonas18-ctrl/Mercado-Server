## BANCO DE DADOS DE UM SISTEMA DE GERENCIAMENTO DE MERCADO

-----------------------------------------------------------------------------------------------------

**INTRODUÇÃO**

Este projeto foi desenvolvido durante uma disciplina da minha faculdade, no curso de Licenciatura em Computação na disciplina de Engenharia de Software.
Por mais que esse banco de dados era algo desnecessário para as atividades em si, o desenvolvimento dela foi de suma importancia para a minha prática em construir um Banco de Dados, e também um Servidor caseiro pessoal.

## TECNOLOGIAS UTILIZADAS

**`SERVIDOR CASEIRO`**

O Banco de dados desenvolvido, está sendo hospedado em um servidor caseiro que um meu antigo dispositivo estava em desuso, onde nesse momento está sendo utilizado como um NAS e Banco de Dados.

Suas especificações fisicas são:

  - Sansung Tab A (8.0)
  - Android 11 (sem atualizações)
  - Armazenamento: 32 GB
  - Memoria RAM: 2 GB

Para poder transformar-lo em um servidor, foi feito os seguintes passo a passos:
   - Instalar o Termux e o Termux:Boot(via F-droid)
   - Baixar o Python (E baixar as bibliotecas do python):
    - uvicorn
    - Flask
    - Jinja2
    - qrcode
    - SQLAlchemy
    - httpcore
    - httpx
    - python-multipart
    - requests
    - urllib3
    - pillow
    - passlib

Como o termux trabalha em um sistema operacional Android, algumas coisas precisa se adaptar, por mais que ele tem bastante semelhanças em Linux tradicional, como por exemplo, a instalação de ferramentas é através de PKG

E no termux, é preciso instalar via pkg:
  - openssh
  - openssl
  - sqlite
  - tar
  - npm
  - nano
  - nodejs
  - make
  - git
  - htop
  - findutils
  - curl
  - cmake
  - make
  - mandoc
  - clang
  - binutils
  - apt
  - bash
  - termux-services
  - termux-tools
  - tur-repo
  - zip
  - unzip
  - wget
  - tree
  - vim
  - which
  - procps
  - net-tools


Algumas ferramentas muito importante para a visualização do banco de dados, foi a do **FileBrowser** que é utilizado para Servidor NAS, o **Taiscale** para eu utilizar de forma remota em outros lugares

**`BANCO DE DADOS`**

O Banco de Dados está sendo desenvolvido na linguagem Python, utilizando o SQLite para o controle do banco
