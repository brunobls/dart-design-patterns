# Observer Method
O Observer é um padrão de projeto comportamental que permite que você defina um mecanismo de assinatura para notificar múltiplos objetos sobre quaisquer eventos que aconteçam com o objeto que eles estão observando.

## Problema
Imagine que você tem dois tipos de objetos: um Cliente e uma Loja. O cliente está muito interessado em uma marca particular de um produto (digamos que seja um novo modelo de iPhone) que logo deverá estar disponível na loja.

O cliente pode visitar a loja todos os dias e checar a disponibilidade do produto. Mas enquanto o produto ainda está a caminho, a maioria desses visitas serão em vão.

Por outro lado, a loja poderia mandar milhares de emails (que poderiam ser considerados como spam) para todos os clientes cada vez que um novo produto se torna disponível. Isso salvaria alguns clientes de incontáveis viagens até a loja. Porém, ao mesmo tempo, irritaria outros clientes que não estão interessados em novos produtos.

Parece que temos um conflito. Ou o cliente gasta tempo verificando a disponibilidade do produto ou a loja gasta recursos notificando os clientes errados.

## Solução
O objeto que tem um estado interessante é quase sempre chamado de sujeito, mas já que ele também vai notificar outros objetos sobre as mudanças em seu estado, nós vamos chamá-lo de publicador. Todos os outros objetos que querem saber das mudanças do estado do publicador são chamados de assinantes.

O padrão Observer sugere que você adicione um mecanismo de assinatura para a classe publicadora para que objetos individuais possam assinar ou desassinar uma corrente de eventos vindo daquela publicadora. Nada tema! Nada é complicado como parece. Na verdade, esse mecanismo consiste em 1) um vetor para armazenar uma lista de referências aos objetos do assinante e 2) alguns métodos públicos que permitem adicionar assinantes e removê-los da lista.

Agora, sempre que um evento importante acontece com a publicadora, ele passa para seus assinantes e chama um método específico de notificação em seus objetos.

Aplicações reais podem ter dúzias de diferentes classes assinantes que estão interessadas em acompanhar eventos da mesma classe publicadora. Você não iria querer acoplar a publicadora a todas essas classes. Além disso, você pode nem estar ciente de algumas delas de antemão se a sua classe publicadora deve ser usada por outras pessoas.

É por isso que é crucial que todos os assinantes implementem a mesma interface e que a publicadora comunique-se com eles apenas através daquela interface. Essa interface deve declarar o método de notificação junto com um conjunto de parâmetros que a publicadora pode usar para passar alguns dados contextuais junto com a notificação.

Se a sua aplicação tem diferentes tipos de publicadoras e você quer garantir que seus assinantes são compatíveis com todas elas, você pode ir além e fazer todas as publicadoras seguirem a mesma interface. Essa interface precisa apenas descrever alguns métodos de inscrição. A interface permitirá assinantes observar o estado das publicadoras sem se acoplar a suas classes concretas.

## Aplicabilidade
- Utilize o padrão Observer quando mudanças no estado de um objeto podem precisar mudar outros objetos, e o atual conjunto de objetos é desconhecido de antemão ou muda dinamicamente. Você pode vivenciar esse problema quando trabalhando com classes de interface gráfica do usuário. Por exemplo, você criou classes de botões customizados, e você quer deixar os clientes colocar algum código customizado para seus botões para que ele ative sempre que usuário aperta um botão. O padrão Observer permite que qualquer objeto que implemente a interface do assinante possa se inscrever para notificações de eventos em objetos da publicadora. Você pode adicionar o mecanismo de inscrição em seus botões, permitindo que o cliente coloque seu próprio código através de classes assinantes customizadas.
- Utilize o padrão quando alguns objetos em sua aplicação devem observar outros, mas apenas por um tempo limitado ou em casos específicos. A lista de inscrição é dinâmica, então assinantes podem entrar e sair da lista sempre que quiserem.

## Prós e contras
 - Prós
    - Princípio aberto/fechado. Você pode introduzir novas classes assinantes sem ter que mudar o código da publicadora (e vice versa se existe uma interface publicadora).
    - Você pode estabelecer relações entre objetos durante a execução.
 - Contra
    - Assinantes são notificados em ordem aleatória

## Relação com outros padrões
O Chain of Responsibility, Command, Mediator e Observer abrangem várias maneiras de se conectar remetentes e destinatários de pedidos:
 - O Chain of Responsibility passa um pedido sequencialmente ao longo de um corrente dinâmica de potenciais destinatários até que um deles atua no pedido.
 - O Command estabelece conexões unidirecionais entre remetentes e destinatários.
 - O Mediator elimina as conexões diretas entre remetentes e destinatários, forçando-os a se comunicar indiretamente através de um objeto mediador.
 - O Observer permite que destinatários inscrevam-se ou cancelem sua inscrição dinamicamente para receber pedidos.

A diferença entre o Mediator e o Observer é bem obscura. Na maioria dos casos, você pode implementar qualquer um desses padrões; mas às vezes você pode aplicar ambos simultaneamente. Vamos ver como podemos fazer isso.

O objetivo primário do Mediator é eliminar dependências múltiplas entre um conjunto de componentes do sistema. Ao invés disso, esses componentes se tornam dependentes de um único objeto mediador. O objetivo do Observer é estabelecer comunicações de uma via dinâmicas entre objetos, onde alguns deles agem como subordinados de outros.

Existe uma implementação popular do padrão Mediator que depende do Observer. O objeto mediador faz o papel de um publicador, e os componentes agem como assinantes que inscrevem-se ou removem a inscrição aos eventos do mediador. Quando o Mediator é implementado dessa forma, ele pode parecer muito similar ao Observer.

Quando você está confuso, lembre-se que você pode implementar o padrão Mediator de outras maneiras. Por exemplo, você pode ligar permanentemente todos os componentes ao mesmo objeto mediador. Essa implementação não se parece com o Observer mas ainda irá ser uma instância do padrão Mediator.

Agora imagine um programa onde todos os componentes se tornaram publicadores permitindo conexões dinâmicas entre si. Não haverá um objeto mediador centralizado, somente um conjunto distribuído de observadores.