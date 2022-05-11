# Factory Method
O Factory Method é um padrão criacional de projeto que fornece uma interface para criar objetos em uma superclasse, mas permite que as subclasses alterem o tipo de objetos que serão criados.

## Problema
Imagine que você está criando uma aplicação de gerenciamento de logística. A primeira versão da sua aplicação pode lidar apenas com o transporte de caminhões, portanto a maior parte do seu código fica dentro da classe Caminhão.

Depois de um tempo, sua aplicação se torna bastante popular. Todos os dias você recebe dezenas de solicitações de empresas de transporte marítimo para incorporar a logística marítima na aplicação.

Boa notícia, certo? Mas e o código? Atualmente, a maior parte do seu código é acoplada à classe Caminhão. Adicionar Navio à aplicação exigiria alterações em toda a base de código. Além disso, se mais tarde você decidir adicionar outro tipo de transporte à aplicação, provavelmente precisará fazer todas essas alterações novamente.

Como resultado, você terá um código bastante sujo, repleto de condicionais que alteram o comportamento da aplicação, dependendo da classe de objetos de transporte.  

## Solução
O padrão Factory Method sugere que você substitua chamadas diretas de construção de objetos (usando o operador new) por chamadas para um método fábrica especial. Não se preocupe: os objetos ainda são criados através do operador new, mas esse está sendo chamado de dentro do método fábrica. Objetos retornados por um método fábrica geralmente são chamados de produtos.

À primeira vista, essa mudança pode parecer sem sentido: apenas mudamos a chamada do construtor de uma parte do programa para outra. No entanto, considere o seguinte: agora você pode sobrescrever o método fábrica em uma subclasse e alterar a classe de produtos que estão sendo criados pelo método.

Porém, há uma pequena limitação: as subclasses só podem retornar tipos diferentes de produtos se esses produtos tiverem uma classe ou interface base em comum. Além disso, o método fábrica na classe base deve ter seu tipo de retorno declarado como essa interface.

Por exemplo, ambas as classes Caminhão e Navio devem implementar a interface Logistica, que declara um método chamado entregar. Cada classe implementa esse método de maneira diferente: caminhões entregam carga por terra, navios entregam carga por mar. O método fábrica na classe LogísticaViária retorna objetos de caminhão, enquanto o método fábrica na classe LogísticaMarítima retorna navios.

O código que usa o método fábrica (geralmente chamado de código cliente) não vê diferença entre os produtos reais retornados por várias subclasses. O cliente trata todos os produtos como um Transporte abstrato. O cliente sabe que todos os objetos de transporte devem ter o método entregar, mas como exatamente ele funciona não é importante para o cliente.

## Prós e contras
- Prós
    - Você evita acoplamentos firmes entre o criador e os produtos concretos.
    - Princípio da responsabilidade única. Você pode mover o código de criação do produto para um único local do programa, facilitando a manutenção do código.
    - Princípio aberto/fechado. Você pode introduzir novos tipos de produtos no programa sem quebrar o código cliente existente.
- Contras
    - O código pode se tornar mais complicado, pois você precisa introduzir muitas subclasses novas para implementar o padrão. O melhor cenário é quando você está introduzindo o padrão em uma hierarquia existente de classes criadoras.

## Relações com outros padrões
Muitos projetos começam usando o Factory Method (menos complicado e mais customizável através de subclasses) e evoluem para o Abstract Factory, Prototype, ou Builder (mais flexíveis, porém mais complicados).

Classes Abstract Factory são quase sempre baseadas em um conjunto de métodos fábrica, mas você também pode usar o Prototype para compor métodos dessas classes.

Você pode usar o Factory Method junto com o Iterator para permitir que uma coleção de subclasses retornem diferentes tipos de iteradores que são compatíveis com as coleções.

O Prototype não é baseado em heranças, então ele não tem os inconvenientes dela. Por outro lado, o Prototype precisa de uma inicialização complicada do objeto clonado. O Factory Method é baseado em herança mas não precisa de uma etapa de inicialização.

O Factory Method é uma especialização do Template Method. Ao mesmo tempo, o Factory Method pode servir como uma etapa em um Template Method grande.

