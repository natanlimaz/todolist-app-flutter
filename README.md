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
   - No VSCode, pressione `Ctrl +` (grave) para abrir o terminal integrado.
   - Certifique-se de estar no diretório raiz do seu projeto Flutter.

4. **Conecte seu dispositio físico ao computador usando um cabo USB**:
   - Certifique-se que a opção de depuração USB do seu aparelho está ativada.
   - Caso apareça uma mensagem de aceitar a permisão de depuração USB, clique em permitir.

5. **Execute o Comando Flutter Run**:
   - No terminal integrado, digite o comando `flutter run` e pressione "Enter".
   - Isso irá compilar seu aplicativo Flutter e iniciá-lo no dispositivo físico conectado.