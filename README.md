# Visão geral
Este projeto consiste em uma calculadora interativa implementada em Python **calculadora.py**, que permite ao usuário realizar operações matemáticas de maneira similar a uma calculadora física. Além disso, foi desenvolvido um script em Shell Script **calculadora.sh** para automatizar a execução do programa, garantindo compatibilidade com diferentes sistemas operacionais e registrando as operações realizadas.

# Estrutura do projeto
O projeto está estruturado da seguinte forma:

- calculadora.py: script principal da calculadora;
- calculadora.sh: script shell para execução automatizada;
- README.md: Documentação do projeto;

## Funcionalidades da calculadora.py
A calculadora permite que o usuário insira um número, depois um operador, e continue assim sucessivamente até pressionar **"="** para obter o resultado final. O objetivo foi proporcionar uma experiência real de usabilidade, como se fosse uma calculadora física.

### Desafios e Soluções

1. Armazenamento e leitura de valores:
   - Foi necessário determinar o momento exato em que a captura de valores deveria parar.
   - As operações são processadas respeitando a ordem de entrada do usuário.
  
2. Execução e comunicação com o shell Script:
   -  Para possibilitar que o Shell Script **calculadora.sh** extraia o resultado da execução do código Python, foi utilizada a cláusula **with** para criar um arquivo resultado.txt que armazena o último resultado calculado.
   -  O comando **tail -n 1 [resultado.txt]** permite ao script capturar apenas a última linha do arquivo.
  
## Funcionalidades da calculadora.sh
Este script automatiza a execução da calculadora, garantindo que todos os arquivos necessários existam antes da execução.

### ações realizadas pelo script

1. Verifica e cria diretórios e arquivos necessários:
   - Se a pasta **calculadora/** não existir, o script a cria.
   - Se o arquivo **dados.csv** não existir, o script o cria.
  
2. Executa o **calculadora.py** até que o usuário finalize.
   
3. Armazena os dados de execução e resultados no **dados.csv**

### Correção de erros
Os principais problemas enfrentados durante o desenvolvimento foram:

1. Erro na verificação do diretório:
   - A verificação inicial do **if** fazia com que a pasta fosse recriada desnecessariamente. Agora, a verificação ocorre separadamente para Windows e Ubuntu.
  
2. Erro na captura de saída do Python:
   - Inicialmente, houve tentativa de armazenar diretamente a saída do Python em uma variável do Shell Script, mas isso fazia com que o programa ficasse esperando entrada indefinidamente.
   - Solução: O resultado agora é salvo em um arquivo temporário **resultado.txt**, e o Shell Script lê apenas a última linha com **tail -n 1**.

# Como Executar

## Linux/macOS:

`chmod +x calculadora.sh`
`./calculadora.sh`

## Windows (via Git Bash ou WSL):

`bash calculado.sh`