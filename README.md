# todoapp

O aplicativo Todo List é uma ferramenta simples e eficiente para ajudá-lo a organizar suas tarefas diárias, criar listas de afazeres e garantir que nada seja esquecido. Com uma interface simples e direta, é perfeito para pessoas ocupadas que precisam de uma maneira rápida e conveniente de gerenciar suas tarefas, seja em casa, no trabalho ou em movimento.

## Instalação e Configuraçao do Ambiente de Desenvolvimento

### 1. Flutter SDK
- [Instruções de Instalação do Flutter SDK](https://docs.flutter.dev/get-started/install/windows/mobile?tab=vscode)
- [Adicionando o Flutter ao PATH do Sistema](https://docs.flutter.dev/get-started/install/windows/mobile?tab=vscode#:~:text=Clique%20em%20Adicionar%20SDK%20ao%20PATH%20.)
- [Instruções de como configurar o seu dispositivo Android para executar o App](https://docs.flutter.dev/get-started/install/windows/mobile?tab=physical#set-up-your-target-android-device)

### 2. Editor de Código
**Visual Studio Code**: [Instalação do VSCode](https://code.visualstudio.com/download)
- **Dart Plugin**: Certifique-se de instalar o plugin do Dart no VSCode para obter suporte completo ao Flutter.
- **Deve ser feita a instalaçao de dois plugins, segue abaixo o id de ambos**
- **Dart**: Dart-Code.dart-code
- **Flutter**: Dart-Code.flutter
- Só copiar e colar na aba de extensão do Visual Studio Code e clicar em instalar.


## Guia Passo a Passo para Executar o Aplicativo

1. **Clonar o repositório**
```bash
git clone git@github.com:natanlimaz/todolist-app-flutter.git
```

2. **Abra o Projeto no VSCode**:
   - Abra o Visual Studio Code.
   - Selecione "File" > "Open Folder" e navegue até o diretório onde seu projeto Flutter está localizado (Onde ficou o clone do projeto).
   - Selecione o diretório raiz do projeto e clique em "Open".

   **Verifique se o Flutter SDK está Configurado**:
   - Verifique se você configurou corretamente o Flutter SDK no seu sistema.
   - Se você não configurou o Flutter SDK, siga as instruções de instalação no site oficial do Flutter em [flutter.dev](https://flutter.dev/docs/get-started/install).

3. **Abra um Terminal Integrado**:
   - No VSCode, pressione `Ctrl Shift '` (grave) para abrir o terminal integrado.
   - Certifique-se de estar no diretório raiz do seu projeto Flutter.

4. **Conecte seu dispositio físico ao computador usando um cabo USB**:
   - Certifique-se de ter configurado corretamente seu dispositivo, um pouco mais acima possui um link com o passo a passo para configura-lo.
   - Certifique-se que a opção de depuração USB do seu aparelho está ativada.
   - Caso apareça uma mensagem de aceitar a permisão de depuração USB, clique em permitir.

5. **Execute o Comando Flutter Run**:
   - No terminal integrado, digite o comando `flutter run` e pressione "Enter".
   - Isso irá instalar as dependências necessárias e compilar seu aplicativo Flutter e iniciá-lo no dispositivo físico conectado (Digite o comando e aguarde!).

## Como Usar o Aplicativo e Suas Funcionalidades
### 1. Adicionar uma Nova Tarefa
- Para adicionar uma nova tarefa, siga os passos abaixo:
  1. Abra o aplicativo "Lista de Tarefas" em seu dispositivo.
  2. Na tela principal, você verá um botão ou ícone "+" para adicionar uma nova tarefa. Toque neste botão.
  3. Um campo de texto será exibido para você inserir o título da nova tarefa. Digite o título da tarefa desejada.
  4. Após digitar o título da tarefa, pressione o botão "Adicionar Tarefa" para confirmar a adição da tarefa.

### 2. Visualizar e Atualizar Tarefas
- Depois de adicionar algumas tarefas, você poderá visualizá-las e gerenciá-las na lista principal. Aqui está o que você pode fazer:
  - **Editar Tarefa**: Se precisar editar o título de uma tarefa existente, toque na tarefa para abrir o modo de edição. Você pode então modificar o título conforme necessário e salvar as alterações clicando em "Adicionar tarefa".
  - **Excluir Tarefa**: Para excluir uma tarefa, toque no ícone de lixeira que aparece na tarefa. A tarefa será removida da lista.

### 3. Buscar Tarefas
- Além de Adicionar, Editar, Deletar e Visualizar todas as suas tarefas na lista principal, você também pode usar a função de busca para encontrar tarefas específicas. Siga estas etapas:
  1. Toque na barra de busca, ela fica localizada na parte superior da tela inicial, na parte superior da lista de tarefas, possui o simbolo de uma lupa.
  2. Digite o nome da tarefa na caixa de texto
  3. O aplicativo irá filtrar as tarefas de acordo com o termo fornecido, exibindo apenas as tarefas que contém em seu nome o termo digitado.