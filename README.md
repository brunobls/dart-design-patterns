# Uma série de exemplos sobre padrões de design OOP e sua implementação no Dart
Padrões de projeto (design patterns) são soluções típicas para problemas comuns em projeto de software. Cada padrão é como uma planta de construção que você pode customizar para resolver um problema de projeto particular em seu código.

## Por que devo aprender?
- Os padrões de projeto são um kit de ferramentas para soluções de problemas comuns em projeto de software. Mesmo que você nunca tenha encontrado esses problemas, saber sobre os padrões é ainda muito útil porque eles ensinam como resolver vários problemas usando princípios de projeto orientado a objetos.

- Os padrões de projeto definem uma linguagem comum que você e seus colegas podem usar para se comunicar mais eficientemente. Você pode dizer, "Oh, é só usar um Singleton para isso," e todo mundo vai entender a ideia por trás da sua sugestão. Não é preciso explicar o que um singleton é se você conhece o padrão e seu nome.

## Classificação dos padrões
Padrões de projeto diferem por sua complexidade, nível de detalhes, e escala de aplicabilidade ao sistema inteiro sendo desenvolvido. Eu gosto da analogia com a construção de uma rodovia: você sempre pode fazer uma intersecção mais segura instalando algumas sinaleiras ou construindo intercomunicações de vários níveis com passagens subterrâneas para pedestres.

Os padrões mais universais e de alto nível são os padrões arquitetônicos; desenvolvedores podem implementar esses padrões em praticamente qualquer linguagem. Ao contrário de outros padrões, eles podem ser usados para fazer o projeto da arquitetura de toda uma aplicação.

Além disso, todos os padrões podem ser categorizados por seu propósito, ou intenção. Esse livro trata de três grupos principais de padrões:

- Os padrões criacionais fornecem mecanismos de criação de objetos que aumentam a flexibilidade e a reutilização de código;
- Os padrões estruturais explicam como montar objetos e classes em estruturas maiores, enquanto ainda mantém as estruturas flexíveis e eficientes;
- Os padrões comportamentais cuidam da comunicação eficiente e da assinalação de responsabilidades entre objetos.

## Padrões de projeto criacionais
- Factory Method: fornece uma interface para criar objetos em uma superclasse, mas permite que as subclasses alterem o tipo de objetos que serão criados.