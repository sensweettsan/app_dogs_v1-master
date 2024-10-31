# app_dogs

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Design Patterns
No Flutter, a recomendação mais comum para design patterns é usar uma arquitetura limpa e bem organizada, como MVVM (Model-View-ViewModel), BLoC (Business Logic Component), ou Provider, para facilitar a manutenção e escalabilidade. Uma boa estrutura de pastas é fundamental para organizar o projeto de forma clara.

Aqui está um exemplo de uma estrutura de pastas recomendada usando o padrão BLoC com Provider:

lib/
│
├── main.dart              # Arquivo principal que inicia o app
├── core/                  # Componentes comuns e genéricos da aplicação
│   ├── utils/             # Funções utilitárias e helpers
│   └── theme/             # Definição de temas
│
├── data/                  # Camada de dados
│   ├── models/            # Modelos de dados (Data models)
│   ├── repositories/      # Repositórios para a comunicação com APIs ou banco de dados
│   └── providers/         # Providers e serviços
│
├── domain/                # Camada de lógica de negócio
│   ├── entities/          # Entidades do domínio
│   ├── usecases/          # Casos de uso (lógica de negócio)
│   └── repositories/      # Interfaces dos repositórios (contratos)
│
├── presentation/          # Camada de apresentação
│   ├── blocs/             # Gerenciadores de estado BLoC ou Cubits
│   ├── pages/             # Páginas ou telas da aplicação
│   ├── widgets/           # Componentes reutilizáveis
│   └── routes/            # Definição das rotas de navegação
│
└── config/                # Configurações gerais do app (ex: variáveis de ambiente)

Essa estrutura separa bem as responsabilidades, tornando o código mais modular e de fácil manutenção. O padrão BLoC é muito utilizado para gerenciar estados de maneira previsível, enquanto o Provider facilita a injeção de dependências.

Se estiver usando um padrão mais simples como MVVM ou somente Provider, a estrutura pode ser ajustada para omitir ou simplificar algumas camadas.

# padrão MVVM (Model-View-ViewModel)
Para organizar esse código em uma estrutura de pastas de acordo com as boas práticas recomendadas, podemos aplicar o padrão MVVM (Model-View-ViewModel) ou BLoC, separando as responsabilidades do modelo de dados, lógica de negócios e persistência do banco de dados. A estrutura pode ficar assim:

lib/
│
├── main.dart                  # Arquivo principal que inicia o app
│
├── core/
│   └── database_helper.dart   # Função de inicialização e manipulação do banco de dados
│
├── data/
│   ├── models/
│   │   └── dog_model.dart     # Modelo do objeto Dog (classe Dog)
│   ├── repositories/
│   │   └── dog_repository.dart  # Repositório que lida com operações CRUD para Dog
│
├── presentation/
│   ├── viewmodels/
│   │   └── dog_viewmodel.dart # Lógica de negócios (interface entre a UI e o repositório)
│   └── pages/
│       └── dog_page.dart      # Tela que exibe os dados e interage com o ViewModel

# Explicação da estrutura:
1. main.dart: Contém a inicialização principal do aplicativo.

2. core/database_helper.dart: Aqui você pode colocar toda a lógica relacionada à configuração e ao acesso ao banco de dados, como a função openDatabase. Isso separa a configuração do banco da lógica de inserção/consulta.

3. data/models/dog_model.dart: Armazena a definição do modelo Dog. Essa classe contém os métodos toMap() e a definição dos atributos id, name e age.

4. data/repositories/dog_repository.dart: Armazena a lógica CRUD para interagir com o banco de dados (inserção, atualização, consulta, deleção). Aqui você pode mover as funções insertDog, updateDog, deleteDog e dogs.

5. presentation/viewmodels/dog_viewmodel.dart: Lida com a interação entre a camada de apresentação e o repositório. Ele pode expor métodos para a UI e lidar com as operações de estado.

6. presentation/pages/dog_page.dart: Arquivo que contém a UI. Essa camada comunica-se com o ViewModel, que por sua vez acessa o repositório para buscar e manipular dados.
