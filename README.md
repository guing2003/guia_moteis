📱 Guia de Motéis GO
Bem-vindo ao Guia de Motéis GO, um aplicativo desenvolvido como parte de um teste técnico para a vaga de Desenvolvedor Mobile (Flutter).

Este aplicativo consome uma API mock para listar motéis, exibindo suas informações e detalhes sobre as suítes disponíveis. Além disso, o projeto inclui testes unitários para garantir a confiabilidade das funcionalidades implementadas.

✨ Funcionalidades
✔️ Exibição da lista de motéis com informações detalhadas    
✔️ Exibição das suítes disponíveis para cada motel    
✔️ Consumo de API utilizando Flutter + HTTP    
✔️ Gerenciamento de estado com Provider     
✔️ Implementação de testes unitários para modelos, providers e serviços   

🛠️ Como Executar o Projeto no Android Studio

1️⃣ Pré-requisitos

Antes de rodar o projeto, certifique-se de ter os seguintes itens instalados:

Flutter: Guia de instalação

Dart (já incluso no SDK do Flutter)

Android Studio: Baixar aqui

Plugin do Flutter e Dart no Android Studio

No Android Studio, vá até:

File → Settings → Plugins → Busque por "Flutter" e instale o plugin. O Dart será instalado automaticamente.

2️⃣ Clone o repositório

Abra o terminal e execute:

git clone https://github.com/seu-usuario/guia-moteis-go.git

Depois, entre no diretório do projeto:

cd guia-moteis-go

3️⃣ Abra o projeto no Android Studio

Inicie o Android Studio

Clique em "Open" e selecione a pasta do projeto clonado

Aguarde o carregamento das dependências

4️⃣ Instale as dependências do projeto

No terminal do Android Studio, execute:

flutter pub get

5️⃣ Inicie um emulador ou conecte um dispositivo físico

Para usar um emulador, clique em "Device Manager" e inicie um dispositivo virtual Android

Para usar um dispositivo físico, ative o modo desenvolvedor e a depuração USB

6️⃣ Execute o aplicativo

No terminal do Android Studio, rode:

flutter run

Ou, clique no botão Run ▶ no topo do Android Studio.

Agora o projeto estará rodando no dispositivo/emulador! 🚀

✅ Testes Unitários

Este projeto conta com testes unitários para validar o funcionamento dos modelos, providers e serviços.

🔹 Rodando os testes

Para executar os testes unitários, utilize o seguinte comando no terminal:

flutter test

Isso irá rodar todos os testes e exibir os resultados no terminal.

🔹 Testes implementados

Teste de Modelos: Verifica se os modelos Motel e Suite são criados corretamente a partir do JSON

Teste de Providers: Testa se o MotelProvider carrega os motéis corretamente e trata erros

Teste de Serviços: Simula requisições à API utilizando mockito para validar a integração do serviço


📌 Tecnologias Utilizadas

Flutter

Dart

Provider (Gerenciamento de estado)

HTTP (Consumo de API)

Mockito (Mock para testes unitários)

Flutter Test (Framework de testes)

📩 Contato

Caso tenha dúvidas ou sugestões, entre em contato!

📧 E-mail: guilhermedelecrode1710@gmail.com

🔗 LinkedIn: www.linkedin.com/in/guilherme-delecrode

🎯 Desenvolvido por Guilherme Nunes 🚀
